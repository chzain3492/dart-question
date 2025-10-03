import 'dart:async';
import 'package:http/http.dart' as http;

// function that fetches urls with concurrency limit
Future<List<String>> fetchConcurrently(List<String> urls, int concurrencyLimit) async {
  List<String> results = [];
  int index = 0;

  // worker function to process urls one by one
  Future<void> worker() async {
    while (index < urls.length) {
      final currentIndex = index++;
      final url = urls[currentIndex];

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          results.add(response.body);
        }
      } catch (e) {
        // ignore failed requests
      }
    }
  }

  // create workers equal to concurrency limit
  List<Future> workers = List.generate(concurrencyLimit, (_) => worker());

  await Future.wait(workers);
  return results;
}
// 