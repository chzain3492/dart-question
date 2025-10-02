void main() {
  var salesData = {
    'North': {
      'Apples': [10, 20, 30],
      'Bananas': [5, 15]
    },
    'South': {
      'Oranges': [40, 10],
      'Grapes': [25]
    },
    'East': {
      'Mangoes': [50, 60]
    }
  };

  print(findTopRegion(salesData)); 
  // Output: East (50 + 60 = 110, highest total)
}
// 