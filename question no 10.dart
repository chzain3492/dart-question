// Higher-order function: memoize
Function(T) memoize<T, R>(R Function(T) f) {
  final cache = <T, R>{}; // Map to store computed results

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
  // Example: Function to compute factorial
  int factorial(int n) {
    print('Calculating factorial of $n');
    return n <= 1 ? 1 : n * factorial(n - 1);
  }

  // Create a memoized version of factorial
  final memoizedFactorial = memoize(factorial);

  print(memoizedFactorial(5)); // Computed
  print(memoizedFactorial(5)); // Cached
  print(memoizedFactorial(4)); // Computed
  print(memoizedFactorial(4)); // Cached
}
// Computing result for 5
Calculating factorial of 5
Calculating factorial of 4
Calculating factorial of 3
Calculating factorial of 2
Calculating factorial of 1
120
Returning cached result for 5
120
Computing result for 4
Calculating factorial of 4
Calculating factorial of 3
Calculating factorial of 2
Calculating factorial of 1
24
Returning cached result for 4
24
// 