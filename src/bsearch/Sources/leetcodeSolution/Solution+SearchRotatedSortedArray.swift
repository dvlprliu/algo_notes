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
        if nums.isEmpty { return -1 }
        // find retation point
        var p = 0
        for i in 0 ..< nums.count - 1 where nums[i] > nums[i + 1] {
            p = i
            break
        }
        var low = -1
        var high = -1
        if p == 0 {
            low = 0
            high = nums.count - 1
        } else if target <= nums[nums.count - 1] {
            low = p + 1
            high = nums.count - 1
        } else {
            low = 0
            high = p
        }
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }

        return nums[low] == target ? low : -1
    }
}
