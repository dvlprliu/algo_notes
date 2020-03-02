extension Sort {
  func bubbleSort<T: Comparable>(_ array: [T]) -> [T] {
    var array = array
    if array.count <= 1 { return array }
    for i in 0..<array.count {
      for j in 0..<array.count - i - 1 where array[j] > array[j + 1] {
        array.swapAt(j, j + 1)
      }
    }
    return array
  }
}