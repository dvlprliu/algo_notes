//
//  Solution+FindMinI.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/7/20.
//
// 153. 寻找旋转排序数组中的最小值
// 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//
// ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
//
// 请找出其中最小的元素。
//
// 你可以假设数组中不存在重复元素。
//
// 示例 1:
// 输入: [3,4,5,1,2]
// 输出: 1
//
// 示例 2:
// 输入: [4,5,6,7,0,1,2]
// 输出: 0
//
// https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/
import Foundation

extension Solution {
    func findMinI(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] > nums[high] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}
