//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/26.
//

/**
 给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

 例如，在下面的 3×4 的矩阵中包含单词 "ABCCED"（单词中的字母已标出）。

 [!img](https://assets.leetcode.com/uploads/2020/11/04/word2.jpg)

 链接：https://leetcode.cn/problems/ju-zhen-zhong-de-lu-jing-lcof

 */
import Foundation

extension Solution {
    enum FindPathInMatrix {
        typealias Solution = ([[Character]], String) -> Bool
        
        static func byBacktrace(_ board:[[Character]], word: String) -> Bool {
            if board.isEmpty || word.count > board.count * board[0].count { return false }
            var board = board
            let wordChars = Array(word)
            for i in 0..<board.count {
                for j in 0..<board[0].count {
                    if board[i][j] == wordChars[0] && isExist(i, j, 0, &board, word) {
                        return true
                    }
                }
            }
            return false
        }

        private static func isExist(_ i: Int, _ j: Int, _ k: Int, _ board: inout [[Character]], _ word: String) -> Bool {
            // 剪枝
            // 行越界
            if i < 0 || i >= board.count || j < 0 || j >= board[0].count || board[i][j] != [Character](word)[k] { return false }
            if k == word.count - 1 { return true }
            board[i][j] = Character(" ")
            let exist = isExist(i - 1, j, k + 1, &board, word)
                || isExist(i + 1, j, k + 1, &board, word)
                || isExist(i, j - 1, k + 1, &board, word)
                || isExist(i, j + 1, k + 1, &board, word)
            board[i][j] = [Character](word)[k]
            return exist
        }
    }
}
