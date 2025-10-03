void main() {
  List<Map<String, String>> apiData = [
    {'userId': '101', 'value': '42.5', 'timestamp': '2025-10-01T12:30:00'},
    {'userId': 'abc', 'value': '99.9', 'timestamp': '2025-10-02T09:00:00'}, // invalid userId
    {'userId': '102', 'value': 'not_a_number', 'timestamp': '2025-10-02T10:00:00'}, // invalid value
    {'userId': '103', 'value': '15.7', 'timestamp': '2025-10-03T08:15:00'},
  ];

  print(validateAndTransform(apiData));
}
  // Output:
  // [
  //   {userId: 101, value: 42.5, timestamp: 2025-10-01 12:30:00.000},
  //   {userId: 103, value: 15.7, timestamp: 2025-10-03 08:15:00.000}
  // ]