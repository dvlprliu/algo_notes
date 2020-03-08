//
//  Solution+SearchRotatedSortedArrayWithDuplicatedElements.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/8/20.
//

// 81. 搜索旋转排序数组 II
// 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//
// ( 例如，数组 [0,0,1,2,2,5,6] 可能变为 [2,5,6,0,0,1,2] )。
//
// 编写一个函数来判断给定的目标值是否存在于数组中。若存在返回 true，否则返回 false。
//
// 示例 1:
//
// 输入: nums = [2,5,6,0,0,1,2], target = 0
// 输出: true
// 示例 2:
//
// 输入: nums = [2,5,6,0,0,1,2], target = 3
// 输出: false


import Foundation

extension Solution {
    func searchII(_ nums: [Int], _ target: Int) -> Bool {
        if nums.isEmpty { return false }
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if target == nums[mid] {
                return true
            }
            // 当nums[low] == nums[mid]时，无法确定所搜范围，
            // 通过low += 1缩小搜索范围
            if nums[low] == nums[mid] {
                low += 1
                continue
            }
            if nums[low] < nums[mid] {
                if target >= nums[low] && target <= nums[mid] {
                    high = mid
                } else {
                    low = mid + 1
                }
            } else {
                if target >= nums[mid] && target <= nums[high] {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
        }
        return false
    }
}
