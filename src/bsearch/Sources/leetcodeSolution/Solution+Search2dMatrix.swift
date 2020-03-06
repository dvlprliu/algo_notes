//
//  Solution+Search2dMatrix.swift
//  leetcodeSolution
//
//  Created by zhzh liu on 3/6/20.
//
// 74. 搜索二维矩阵
// 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
//
// 每行中的整数从左到右按升序排列。
// 每行的第一个整数大于前一行的最后一个整数。
// 示例 1:
//
// 输入:
// matrix = [
//   [1,   3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 50]
// ]
// target = 3
// 输出: true
// 示例 2:
//
// 输入:
// matrix = [
//   [1,   3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 50]
// ]
// target = 13
// 输出: false

import Foundation

extension Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty { return false }
        let m = matrix[0].count // columns
        let n = matrix.count    // rows
        var low = 0
        var high = m * n - 1
        while low <= high {
            let mid = low + (high - low) / 2
            let value = matrix[mid / m][mid % m]
            if value == target {
                return true
            }
            if target < value {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return false
    }
}
