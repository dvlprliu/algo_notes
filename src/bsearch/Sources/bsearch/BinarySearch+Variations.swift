extension BinarySearch {
    // 找到第一个等于n的元素
    func bsearch(from nums: [Int], firstEqualTo n: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if nums[mid] > n {
                high = mid - 1
            } else if nums[mid] < n {
                low = mid + 1
            } else {
                if mid == 0 || nums[mid - 1] != n {
                    return mid
                }
                high = mid - 1
            }
        }
        return -1
    }

    // 找到最后一个等于n的元素
    func bsearch(from nums: [Int], lastEqualTo n: Int) -> Int {
        var low = 0
        var high = nums.count
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if nums[mid] < n {
                low = mid + 1
            } else if nums[mid] > n {
                high = mid - 1
            } else {
                if mid == nums.count - 1 || nums[mid + 1] != n {
                    return mid
                }
                low = mid + 1
            }
        }
        return -1
    }

    // 找到第一个大于等于n的元素
    func bsearch(from nums: [Int], firstGreaterThanOrEqualTo n: Int) -> Int {
        var low = 0
        var high = nums.count
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if nums[mid] >= n {
                if mid == 0 || nums[mid - 1] < n { return mid }
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return -1
    }

    // 找到最后一个小于等于n的元素
    func bsearch(from nums: [Int], lastLessThanOrEqualTo n: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if nums[mid] <= n {
                if mid == nums.count || nums[mid + 1] > n {
                    return mid
                }
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return -1
    }
}
