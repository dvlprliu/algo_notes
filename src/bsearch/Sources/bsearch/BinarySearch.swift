class BinarySearch {
    // 二分查找的迭代实现
    func bsearchIterate(_ nums:[Int], _ n: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if nums[mid] < n {
                low = mid + 1
            } else if nums[mid] < n {
                high = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }

    // 二分查找的递归实现
    func bsearchRecursive(_ nums: [Int], _ n: Int) -> Int {
        return _bsearchRecursive(nums, n, low: 0, high: nums.count - 1)
    }

    private func _bsearchRecursive(_ nums: [Int], _ n: Int, low: Int, high: Int) -> Int {
        if low > high { return -1 }
        let mid = low + ((high - low) >> 1)
        if nums[mid] == n {
            return mid
        } else if nums[mid] > n {
            return _bsearchRecursive(nums, n, low: low, high: mid - 1)
        } else {
            return _bsearchRecursive(nums, n, low: mid + 1, high: high)
        }
    }
}
