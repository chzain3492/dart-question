void main() {
  List<Map<String, dynamic>> users = [
    {
      'name': 'Alice',
      'age': 25,
      'posts': [
        {'title': 'Hello World', 'likes': 10},
        {'title': 'Dart is fun', 'likes': 20},
      ]
    },
    {
      'name': 'Bob',
      'age': 30,
      'posts': [
        {'title': 'My first post', 'likes': 5}
      ]
    },
    {
      'name': 'Charlie',
      'age': 22,
      'posts': [] // no posts
    }
  ];

  print(processUserData(users)); // Output: Alice
}
// 