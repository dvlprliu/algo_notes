extension Sort {
    public func mergeSort(_ array: [T]) -> [T] {
        if array.count <= 1 { return array }
        let mid = array.count / 2
        let left = mergeSort(Array(array[0..<mid]))
        let right = mergeSort(Array(array[mid..<array.count]))
        return merge(left, right)
    }

    private func merge(_ left: [T], _ right: [T]) -> [T] {
        var leftIdx = 0
        var rightIdx = 0
        var result = [T]()
        func appendLeft(_ idx: inout Int) {
            result.append(left[idx])
            idx += 1
        }
        func appendRight(_ idx: inout Int) {
            result.append(right[idx])
            idx += 1
        }
        while leftIdx < left.count, rightIdx < right.count {
            if left[leftIdx] < right[rightIdx] {
                appendLeft(&leftIdx)
            } else if left[leftIdx] > right[rightIdx] {
                appendRight(&rightIdx)
            } else {
                appendLeft(&leftIdx)
                appendRight(&rightIdx)
            }
        }

        while rightIdx < right.count {
            appendRight(&rightIdx)
        }
        while leftIdx < left.count {
            appendLeft(&leftIdx)
        }
        return result
    }
}
