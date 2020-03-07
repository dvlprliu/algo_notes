//
//  Solution+FindPeakElement.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/7/20.
//

// 162. 寻找峰值
// 峰值元素是指其值大于左右相邻值的元素。
//
// 给定一个输入数组 nums，其中 nums[i] ≠ nums[i+1]，找到峰值元素并返回其索引。
//
// 数组可能包含多个峰值，在这种情况下，返回任何一个峰值所在位置即可。
//
// 你可以假设 nums[-1] = nums[n] = -∞。
//
// 示例 1:
//
// 输入: nums = [1,2,3,1]
// 输出: 2
// 解释: 3 是峰值元素，你的函数应该返回其索引 2。
// 示例 2:
//
// 输入: nums = [1,2,1,3,5,6,4]
// 输出: 1 或 5
// 解释: 你的函数可以返回索引 1，其峰值元素为 2；
//      或者返回索引 5， 其峰值元素为 6。

import Foundation

extension Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let nums = [Int.min] + nums + [Int.min]
        for i in 1...nums.count - 1 {
            if nums[i] > nums[i - 1] && nums[i] > nums[i + 1] {
                return i - 1
            }
        }
        return -1
    }
}

// # 线性搜索
// 从头到尾遍历所有元素，如果该元素大于左右相邻的元素，就返回。
// 小trick，在数组首位各添加了 Int.min，方便处理第一个元素和最后一个元素


