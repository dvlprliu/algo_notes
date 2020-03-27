class BinarySearch {
    // 二分查找的迭代实现
    func bsearchIterate(_ nums:[Int], _ n: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] == n {
                return mid
            } else if nums[mid] < n {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return -1
    }

    // 二分查找的递归实现
    func bsearchRecursive(_ nums: [Int], _ n: Int) -> Int {
        return bsearchRecursive(nums, n, low: 0, high: nums.count - 1)
    }

    private func bsearchRecursive(_ nums: [Int], _ n: Int, low: Int, high: Int) -> Int {
        guard low <= high else { return -1 }
        let mid = low + (high - low) / 2
        if nums[mid] == n {
            return mid
        } else if nums[mid] < n {
            return bsearchRecursive(nums, n, low: mid + 1, high: high)
        } else {
            return bsearchRecursive(nums, n, low: low, high: mid - 1)
        }
    }
}
