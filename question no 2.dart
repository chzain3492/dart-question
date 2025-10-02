void main() {
  var data = [1, [2, 3, [4, 2]], 5, [1, [6, [7, 3]]]];
  print(flattenAndUnique(data)); 
  // Output: [1, 2, 3, 4, 5, 6, 7]
}
// 