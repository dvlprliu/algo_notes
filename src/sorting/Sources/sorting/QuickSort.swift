extension Sort {
    func quickSort(_ array: [T]) -> [T] {
        if array.count <= 1 { return array }
        var array = array
        quickSort(&array, low: 0, hi: array.count - 1)
        return array
    }

    private func quickSort(_ array: inout [T], low: Int, hi: Int) {
        guard low < hi else { return }
        let p = partition(&array, low: low, hi: hi)
        quickSort(&array, low: low, hi: p - 1)
        quickSort(&array, low: p + 1, hi: hi)
    }

    private func partition(_ array: inout [T], low: Int, hi: Int) -> Int {
        let pivot = array[hi]
        var i = low
        for j in low ..< hi where array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
        array.swapAt(i, hi)
        return i
    }
}
