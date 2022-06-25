//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/24.
//

/*
 给你一个 升序排列 的数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。

 由于在某些语言中不能改变数组的长度，所以必须将结果放在数组nums的第一部分。更规范地说，如果在删除重复项之后有 k 个元素，那么 nums 的前 k 个元素应该保存最终结果。

 将最终结果插入 nums 的前 k 个位置后返回 k 。

 不要使用额外的空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 链接：https://leetcode.cn/problems/remove-duplicates-from-sorted-array
 */
import Foundation

extension Solution {
    enum RemoveDuplicates {
        /// 移除重复元素
        ///
        /// 使用双指针进行比较，设有两个指针i、j，使用i在数组中找到第一个与i不相等的元素，
        /// 并将该元素赋值给i+1
        static func brutal(_ nums: inout [Int]) -> Int {
            if nums.isEmpty { return 0 }
            var i = 0
            for j in 1..<nums.count {
                if nums[i] != nums[j] {
                    i += 1
                    nums[i] = nums[j]
                }
            }
            return i + 1
        }

        static func brutalWithWhere(_ nums: inout [Int]) -> Int {
            if nums.isEmpty { return 0 }
            var i = 0
            for j in 1 ..< nums.count where nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
            return i + 1
        }

        /// 移除重复元素
        ///
        /// 基本解法与brutal的接发相同，针对有序且无重复元素的case进行优化
        static func brutalOptimal(_ nums: inout [Int]) -> Int {
            if nums.isEmpty { return 0 }
            var i = 0
            for j in 1 ..< nums.count {
                if nums[i] != nums[j] {
                    i += 1
                    if j - i > 0 {
                        nums[i] = nums[j]
                    }
                }
            }
            return i + 1
        }
    }
}
