// Higher-order function: memoize
Function(T) memoize<T, R>(R Function(T) f) {
  final cache = <T, R>{}; // Store previous results

  return (T arg) {
    if (cache.containsKey(arg)) {
      print('Returning cached result for $arg');
      return cache[arg]!;
    } else {
      print('Computing result for $arg');
      final result = f(arg);
      cache[arg] = result;
      return result;
    }
  };
}

void main() {
  // Example function: compute square
  int square(int n) {
    print('Calculating square of $n');
    return n * n;
  }

  // Create a memoized version of square
  final memoizedSquare = memoize(square);

  print(memoizedSquare(4)); // Computes and stores result
  print(memoizedSquare(4)); // Returns cached result
  print(memoizedSquare(5)); // Computes and stores new result
  print(memoizedSquare(5)); // Returns cached result
}
// 