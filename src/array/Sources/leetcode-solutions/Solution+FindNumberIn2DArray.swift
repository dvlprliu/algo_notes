//
//  Solution+FindNumberIn2DArray.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import Foundation

/*
 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个高效的函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

 链接：https://leetcode.cn/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof
 */

extension Solution {
    enum FindNumberIn2DArray {
        typealias Solution = ([[Int]], Int) -> Bool

        static func linearSearchFromTopRight(_ matrix: [[Int]], target: Int) -> Bool {
            if matrix.isEmpty { return false }
            var i = 0
            var j = matrix[0].count - 1
            while i < matrix.count && j >= 0 {
                if target == matrix[i][j] {
                    return true
                }
                if target > matrix[i][j] {
                    i += 1
                } else {
                    j -= 1
                }
            }
            return false
        }

        static func linearSearchFromBottomLeft(_ matrix: [[Int]], target: Int) -> Bool {
            if matrix.isEmpty { return false }
            var i = matrix.count - 1
            var j = 0
            while i >= 0 && j < matrix[0].count {
                if target == matrix[i][j] {
                    return true
                } else if target > matrix[i][j] {
                    j += 1
                } else {
                    i -= 1
                }
            }
            return false
        }

        /// 朴素解，按行查找是否包含目标元素
        ///
        /// 因为每行的元素都是升序的，所以每行可以使用二分法的进行查找。
        /// 时间复杂度O(nlogn)
        static func findByRow(_ matrix: [[Int]], target: Int) -> Bool {
            if matrix.isEmpty { return false }
            for row in matrix {
                if findElementInRow(row, target: target) {
                    return true
                }
            }
            return false
        }

        /// 朴素解，使用标准库方法进行查找
        static func findByRowUsingStd(_ matrix: [[Int]], target: Int) -> Bool {
            if matrix.isEmpty { return false }
            for row in matrix {
                if row.contains(target) {
                    return true
                }
            }
            return false
        }

        private static func findElementInRow(_ row: [Int], target: Int) -> Bool {
            if row.isEmpty { return false }
            var low = 0
            var high = row.count - 1
            while high >= low {
                let mid = low + (high - low) / 2
                if row[mid] == target {
                    return true
                } else if row[mid] < target {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            return false
        }
    }
}
