extension Sort {
    public func quickSort<T: Comparable>(_ array: [T]) -> [T] {
        if array.count <= 1 { return array }
        var array = array
        _quickSort(&array, low: 0, hi: array.count - 1)
        return array
    }

    private func _quickSort<T: Comparable>(_ array: inout [T], low: Int, hi: Int) {
        guard low < hi else { return }
        let p = partition(&array, low: low, hi: hi)
        _quickSort(&array, low: low, hi: p - 1)
        _quickSort(&array, low: p + 1, hi: hi)
    }

    private func partition<T: Comparable>(_ array: inout [T], low: Int, hi: Int) -> Int {
        let pivot = array[hi]
        var i = low
        for j in low..<hi where array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
        array.swapAt(hi, i)
        return i
    }
}
