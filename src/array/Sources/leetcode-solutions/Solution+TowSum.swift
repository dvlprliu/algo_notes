//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/24.
//

import Foundation


/*
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]


 提示：
 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 只会存在一个有效答案


 ！！！ 在做这个题的时候要搞清楚输入的边界情况
    1. 如果没有对nums数组做数量限制，需要判断nums的数量

 */
extension Solution {
    enum TwoSum {
        /// 遍历的解法
        static func brutalForce(_ nums: [Int], _ target: Int) -> [Int] {
            if nums.count < 1 {
                return []
            }
            var i = 0
            var j = 0
            for num in nums {
                let sub = target - num
                j = i + 1
                for other in nums[j..<nums.count] {
                    if other == sub {
                        return [i, j]
                    }
                    j += 1
                }
                i += 1
            }
            return []
        }

        static func brutalForceV2(_ nums: [Int], _ target: Int) -> [Int] {
            for i in 0..<nums.count {
                for j in (i + 1)..<nums.count {
                    if nums[i] + nums[j] == target { return [i, j] }
                }
            }
            return []
        }

        /// 使用hashmap把时间复杂度降为O(1)
        ///
        /// 这个实现是在方法执行之初就建立完整的映射表，可能会消耗更多的内存
        static func usingHashMap(_ nums: [Int], _ target: Int) -> [Int] {
            let pairs = nums.enumerated().map { ($1, $0) }
            let dic = [Int: Int](pairs, uniquingKeysWith: { $1 })
            for (index, num) in nums.enumerated() {
                let sub = target - num
                if index == dic[sub] {
                    continue
                }
                if let other = dic[sub] {
                    return [index, other]
                }
            }
            return []
        }

        /// 使用hashmap把时间复杂度降为O(1)
        ///
        /// 这个实现是在遍历的过程中建立映射表，可以优化内存的使用
        static func usingHashMapV2(_ nums: [Int], _ target: Int) -> [Int] {
            var mapping = [Int: Int]()
            for i in 0..<nums.count {
                let sub = target - nums[i]
                if let other = mapping[sub] {
                    return [i, other]
                }
                mapping[nums[i]] = i
            }
            return []
        }
    }

}
