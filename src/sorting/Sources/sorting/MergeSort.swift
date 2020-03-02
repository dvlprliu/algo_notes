extension Sort {
  public func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count <= 1 { return array }
    let mid = array.count / 2
    let left = mergeSort(Array(array[0..<mid]))
    let right = mergeSort(Array(array[mid..<array.count]))
    return merge(left, right)
  }

  private func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var result = [T]()
    while leftIndex < left.count && rightIndex < right.count {
      if left[leftIndex] < right[rightIndex] {
        result.append(left[leftIndex])
        leftIndex += 1
      } else if left[leftIndex] > right[rightIndex] {
        result.append(right[rightIndex])
        rightIndex += 1
      } else {
        result.append(left[leftIndex])
        leftIndex += 1
        result.append(right[rightIndex])
        rightIndex += 1
      }
    }

    while leftIndex < left.count {
      result.append(left[leftIndex])
      leftIndex += 1
    }
    while rightIndex < right.count {
      result.append(right[rightIndex])
      rightIndex += 1
    }
    return result
  }
}