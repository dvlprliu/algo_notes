//
//  Solution+Symmetric.swift
//  leetcode
//
//  Created by zhzh liu on 4/2/20.
//
// 101. 对称二叉树
// 给定一个二叉树，检查它是否是镜像对称的。
//
// 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
//
//     1
//    / \
//   2   2
//  / \ / \
// 3  4 4  3
// 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
//
//     1
//    / \
//   2   2
//    \   \
//    3    3
// 说明:
//
// 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
//
// https://leetcode-cn.com/problems/symmetric-tree/

import Foundation

extension Solution {
    func isSymmetric_recursive(_ tree: TreeNode?) -> Bool {
        func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil { return true }
            if p == nil || q == nil { return false }
            return p?.value == q?.value
                && isMirror(p?.left, q?.right)
                && isMirror(p?.right, q?.left)
        }
        return isMirror(tree?.left, tree?.right)
    }

    func isSymmetric_iterate(_ tree: TreeNode?) -> Bool {
        guard let node = tree else { return true }
        var queue: [TreeNode?] = []
        queue.append(node)
        queue.append(node)
        while !queue.isEmpty {
            let left = queue.removeFirst()
            let right = queue.removeFirst()
            if left == nil && right == nil { continue }
            if left == nil || right == nil { return false }
            if left?.value != right?.value { return false }
            queue.append(left?.left)
            queue.append(right?.right)
            queue.append(left?.right)
            queue.append(right?.left)
        }
        return true
    }
}
