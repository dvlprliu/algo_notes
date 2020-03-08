//
//  Solution+MinSizeSubarraySum.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/8/20.
//

// 209. 长度最小的子数组
// 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
//
// 示例:
//
// 输入: s = 7, nums = [2,3,1,2,4,3]
// 输出: 2
// 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
// 进阶:
//

import Foundation

extension Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var minLength = nums.count + 1
        var i = 0
        while i < nums.count {
            var sum = 0
            var length = 0
            for j in i..<nums.count {
                sum += nums[j]
                length += 1
                if sum >= s {
                    minLength = min(minLength, length)
                    break
                }
            }
            i += 1
        }
        return minLength == nums.count + 1 ? 0 : minLength
    }

    func minSubArrayLen_slidingWindow(_ s: Int, _ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var left = 0
        var right = 0
        var minLength = Int.max
        var sum = 0
        while right < nums.count {
            sum += nums[right]
            right += 1
            while sum >= s {
                minLength = min(minLength, right - left)
                sum -= nums[left]
                left += 1
            }
        }

        return minLength == Int.max ? 0 : minLength
    }
}
