import 'dart:async';
import 'package:http/http.dart' as http;

// custom exception
class MaxRetriesExceededException implements Exception {
  final String message;
  MaxRetriesExceededException(this.message);

  @override
  String toString() => "MaxRetriesExceededException: $message";
}

// function that fetches data with timeout and retry
Future<String> fetchWithTimeoutAndRetry(String url) async {
  const int maxRetries = 3;
  int attempt = 0;
  int delaySeconds = 1;

  while (attempt < maxRetries) {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } on TimeoutException catch (_) {
      print("Attempt ${attempt + 1}: Request timed out");
    } catch (e) {
      print("Attempt ${attempt + 1}: Error occurred -> $e");
    }

    attempt++;
    if (attempt < maxRetries) {
      print("Retrying in $delaySeconds seconds...");
      await Future.delayed(Duration(seconds: delaySeconds));
      delaySeconds *= 2; // exponential backoff
    }
  }

  throw MaxRetriesExceededException("Failed after $maxRetries retries.");
}
// void main() async {
  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    String data = await fetchWithTimeoutAndRetry(url);
    print(data);
  } catch (e) {
    print(e);
  }
}