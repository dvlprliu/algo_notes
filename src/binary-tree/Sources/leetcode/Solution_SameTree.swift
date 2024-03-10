//
//  Solution_SameTree.swift
//  leetcode
//
//  Created by zhzh liu on 4/2/20.
//
// 给定两个二叉树，编写一个函数来检验它们是否相同。
//
// 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
//
// 示例 1:
//
// 输入:       1         1
//           / \       / \
//          2   3     2   3
//
//         [1,2,3],   [1,2,3]
//
// 输出: true
// 示例 2:
//
// 输入:      1          1
//           /           \
//          2             2
//
//         [1,2],     [1,null,2]
//
// 输出: false
// 示例 3:
//
// 输入:       1         1
//           / \       / \
//          2   1     1   2
//
//         [1,2,1],   [1,1,2]
//
// 输出: false
//
// https://leetcode-cn.com/problems/same-tree/

import binary_tree
import Foundation

extension Solution {
    func sameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        return p?.value == q?.value
            && sameTree(p?.left, q?.left)
            && sameTree(p?.right, q?.right)
    }
}
