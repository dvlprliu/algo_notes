//
//  Solution+SearchRotatedSortedArray.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/6/20.
//
// # 33. 搜索旋转排序数组
// 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//
// ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
//
// 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
//
// 你可以假设数组中不存在重复的元素。
//
// 你的算法时间复杂度必须是 O(log n) 级别。
//
// 示例 1:
// ```
// 输入: nums = [4,5,6,7,0,1,2], target = 0
// 输出: 4
// ```
import Foundation

extension Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
                return mid
            }
            // [low, mid]是单调递增的区间，说明转轴在mid右边
            if nums[low] <= nums[mid] {
                // 如果[low, mid]包含要查找的元素，则将查找范围缩小到
                // [low, mid - 1]之间
                if target < nums[mid] && target >= nums[low] {
                    high = mid - 1
                }
                // 到mid右边去找
                else {
                    low = mid + 1
                }
            }
            // [mid, high] 之间是单调递增的，说明转轴在mid左边
            else {
                // 如果[mid, high]之间包含目标元素，则将查找范围缩小
                // 到[mid + 1, high]之间
                if target > nums[mid] && target <= nums[high] {
                    low = mid + 1
                }
                // 到mid右边去找
                else {
                    high = mid - 1
                }
            }
        }
        return -1
    }
}
