//
//  Solution+TwoSum.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/8/20.
//

// 167. 两数之和 II - 输入有序数组
// 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
//
// 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
//
// 说明:
//
// 返回的下标值（index1 和 index2）不是从零开始的。
// 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
// 示例:
//
// 输入: numbers = [2, 7, 11, 15], target = 9
// 输出: [1,2]
// 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

import Foundation

extension Solution {
    func twoSum_bsearch(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [ ] }
        for (idx, n) in nums.enumerated() {
            let complement = target - n
            var low = idx + 1
            var high = nums.count - 1
            while low <= high {
                let mid = low + (high - low) / 2
                if nums[mid] == complement {
                    return [idx + 1, mid + 1]
                } else if nums[mid] < complement {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
        }
        return []
    }

    func twoSum_towPointer(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [ ] }
        var l = 0, r = nums.count - 1
        while l < r {
            let sum = nums[l] + nums[r]
            if sum == target {
                return [l + 1, r + 1]
            } else if sum < target {
                l += 1
            } else {
                r -= 1
            }
        }
        return []
    }
}
