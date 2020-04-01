extension Sort {
    func quickSort(_ array: [T]) -> [T] {
        if array.count <= 1 { return array }
        var array = array
        quickSort(&array, low: 0, hi: array.count - 1)
        return array
    }

    private func quickSort(_ array: inout [T], low: Int, hi: Int) {
        guard low < hi else { return }
        let p = partition_low(&array, low: low, high: hi)
        quickSort(&array, low: low, hi: p - 1)
        quickSort(&array, low: p + 1, hi: hi)
    }

    private func partition_high(_ array: inout [T], low: Int, hi: Int) -> Int {
        let pivot = array[hi]
        var i = low
        for j in low ..< hi where array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
        array.swapAt(i, hi)
        return i
    }

    private func partition_low(_ array: inout [T], low: Int, high: Int) -> Int {
        var left = low
        var right = high
        let pivot = array[low]
        while left < right {
            while left < right, array[right] >= pivot {
                right -= 1
            }
            array[left] = array[right]

            while left < right, array[left] < pivot {
                left += 1
            }
            array[right] = array[left]
        }
        array[left] = pivot
        return left
    }
}
