//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/29.
//

import Foundation

extension Solution {
    enum MaxSubArray {
        typealias Solution = ([Int]) -> Int

        /// 朴素算法
        ///
        /// complexity: O(n^2)
        static func simple(_ nums: [Int]) -> Int {
            if nums.isEmpty { return 0 }
            var max = nums[0]
            for i in 0 ..< nums.count {
                var sum = 0
                for j in i ..< nums.count {
                    sum += nums[j]
                    max = Swift.max(max, sum)
                }
            }
            return max
        }

        /// 动态规划
        ///
        /// Time complexity: O(n)
        /// Space complexity: O(1)
        static func dp(_ nums: [Int]) -> Int {
            if nums.isEmpty { return 0 }
            var dp = [Int](repeating: 0, count: nums.count)
            dp[0] = nums[0]
            var max = nums[0]
            for i in 1..<nums.count {
                if dp[i - 1] <= 0 {
                    dp[i] = nums[i]
                } else {
                    dp[i] = dp[i - 1] + nums[i]
                }
                max = Swift.max(max, dp[i])
            }
            return max
        }

        /// 动态规划
        ///
        /// Time complexity: O(n)
        /// Space complexity: O(1)
        static func dpMemOptimal(_ nums: [Int]) -> Int {
            if nums.isEmpty { return 0 }
            var dp = 0
            var max = nums[0]
            for num in nums {
                dp = Swift.max(num, dp + num)
                max = Swift.max(max, dp)
            }
            return max
        }
    }
}
