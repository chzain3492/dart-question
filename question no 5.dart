void main() {
  var data = {
    "A": ["x", "y"],
    "B": ["y", "z"],
    "C": ["x"]
  };

  print(invertMap(data));
  // Output:
  // {x: [A, C], y: [A, B], z: [B]}
}
// 