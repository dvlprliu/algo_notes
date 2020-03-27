extension Sort {
    public func selectionSort(_ array: [T]) -> [T] {
        if array.count <= 1 { return array }
        var array = array
        for i in 0 ..< array.count {
            var lowest = i
            for j in i + 1 ..< array.count {
                if array[lowest] > array[j] {
                    lowest = j
                }
            }
            array.swapAt(lowest, i)
        }
        return array
    }
}
