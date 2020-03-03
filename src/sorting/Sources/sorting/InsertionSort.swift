extension Sort {
    public func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
        if array.count <= 1 { return array }
        var array = array
        for i in 1..<array.count {
            var j = i
            let value = array[i]
            while j > 0, value < array[j - 1] {
                array[j] = array[j - 1]
                j -= 1
            }
            array[j] = value
        }
        return array
    }
}
