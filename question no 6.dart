import 'dart:convert';
import 'package:http/http.dart' as http;

// custom exception class
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}

// function that fetches urls one by one
Future<List<String>> fetchSequentially(List<String> urls) async {
  List<String> results = [];

  for (var url in urls) {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        results.add(response.body);
      } else {
        throw NetworkException("Failed to fetch $url with status ${response.statusCode}");
      }
    } catch (e) {
      throw NetworkException("Error fetching $url -> $e");
    }
  }

  return results;
}
void main() async {
  List<String> urls = [
    'https://jsonplaceholder.typicode.com/posts/1',
    'https://jsonplaceholder.typicode.com/posts/2',
    'https://jsonplaceholder.typicode.com/posts/3',
  ];

  try {
    List<String> data = await fetchSequentially(urls);
    for (var content in data) {
      print(content);
    }
  } catch (e) {
    print(e);
  }
}
// 