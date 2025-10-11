// Simulated async function (like a network call)
Future<String> _fetchFromNetwork(String key) async {
  print('Fetching "$key" from network...');
  await Future.delayed(Duration(seconds: 2)); // simulate delay
  return 'Data for $key';
}

// Cache map to store fetched Futures
final Map<String, Future<String>> _cache = {};

// Function that caches and returns data
Future<String> getCachedData(String key) {
  if (_cache.containsKey(key)) {
    print('Returning cached data for "$key"');
    return _cache[key]!; // return the cached Future
  } else {
    print('No cache found for "$key". Fetching...');
    final future = _fetchFromNetwork(key);
    _cache[key] = future; // store the Future in cache
    return future;
  }
}

void main() async {
  print(await getCachedData('user1')); // Calls network
  print(await getCachedData('user1')); // Uses cache
  print(await getCachedData('user2')); // Calls network again
  print(await getCachedData('user2')); // Uses cache
}
// 