void main() async {
  // create a sample stream
  Stream<List<int>> numberStream() async* {
    yield [1, 2, 3, 4];
    yield [5, 6, 7, 8];
    throw Exception("Stream error!"); // example error
    yield [10, 12];
  }

  await for (var value in processStream(numberStream())) {
    print(value);
  }
}
// 