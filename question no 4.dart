void main() {
  List<Map<String, String>> apiData = [
    {'userId': '101', 'value': '42.5', 'timestamp': '2025-10-01T12:30:00'},
    {'userId': 'abc', 'value': '99.9', 'timestamp': '2025-10-02T09:00:00'}, // invalid userId
    {'userId': '102', 'value': 'not_a_number', 'timestamp': '2025-10-02T10:00:00'}, // invalid value
    {'userId': '103', 'value': '15.7', 'timestamp': '2025-10-03T08:15:00'},
  ];

  print(validateAndTransform(apiData));
  // Output:
  // [
  //   {userId: 101, value: 42.5, timestamp: 2025-10-01 12:30:00.000},
  //   {userId: 103, value: 15.7, timestamp: 2025-10-03 08:15:00.000}
  // ]
}
List<Map<String, dynamic>> validateAndTransform(List<Map<String, String>> data) {
  List<Map<String, dynamic>> result = [];

  for (var entry in data) {
    try {
      int userId = int.parse(entry['userId']!);
      double value = double.parse(entry['value']!);
      DateTime timestamp = DateTime.parse(entry['timestamp']!);

      result.add({
        'userId': userId,
        'value': value,
        'timestamp': timestamp,
      });
    } catch (e) {
      // Skip invalid entries
      continue;
    }
  }

  return result;
}
// 