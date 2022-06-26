//
//  Solution+FindMin.swift
//  
//
//  Created by zhzh liu on 2022/6/26.
//

/**
 # 旋转数组的最小数字

 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。

 给你一个可能存在 重复 元素值的数组 numbers ，它原来是一个升序排列的数组，并按上述情形进行了一次旋转。请返回旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一次旋转，该数组的最小值为 1。

 注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 。


 示例 1：

 输入：numbers = [3,4,5,1,2]
 输出：1
 示例 2：

 输入：numbers = [2,2,2,0,1]
 输出：0

 链接：https://leetcode.cn/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof
 */

import Foundation

extension Solution {
    enum FindMin {
        public typealias Solution = ([Int]) -> Int

        /// 使用标准库方法找到最小值
        ///
        /// 面试官会不开心的 ;]
        static func usingStd(_ numbers: [Int]) -> Int {
            numbers.sorted().first ?? -1
        }

        /// 朴素解法-遍历寻找最小值
        ///
        /// 使用遍历的方法在数组中寻找最小值，没有利用输入的任何特性，效率很低
        /// O(n)
        static func byIterate(_ numbers: [Int]) -> Int {
            if numbers.isEmpty { return -1 }
            var find = Int.max
            for number in numbers {
                find = min(number, find)
            }
            return find
        }


        /// 折半查找
        static func byBsearch(_ numbers: [Int]) -> Int {
            // 进行折半查找
            // 1. low < mid，说明旋转在后半部分
            // 2. low > mid, 说明旋转在前半部分
            var low = 0
            var high = numbers.count - 1
            while low < high {
                let mid = low + (high - low) / 2
                if numbers[mid] > numbers[high] {
                    low = mid + 1
                } else if numbers[mid] == numbers[high] {
                    high = high - 1
                } else {
                    high = mid
                }
            }
            return numbers[high]
        }
    }
}
