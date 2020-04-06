//
//  Solution+MaxDepth.swift
//  leetcode
//
//  Created by zhzh liu on 4/2/20.
//
// 104. 二叉树的最大深度
// 给定一个二叉树，找出其最大深度。
//
// 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
//
// 说明: 叶子节点是指没有子节点的节点。
//
// 示例：
// 给定二叉树 [3,9,20,null,null,15,7]，
//
//     3
//    / \
//   9  20
//     /  \
//    15   7
// 返回它的最大深度 3
//
// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/

import Foundation

extension Solution {
    func maxDepth_recursive(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth_recursive(root.left), maxDepth_recursive(root.right)) + 1
    }

    func maxDepth_iterate(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack: [(Int, TreeNode?)] = [(1, root)]
        var depth = 0
        while !stack.isEmpty {
            let (curDepth, node) = stack.removeLast()
            if node != nil {
                depth = max(curDepth, depth)
                stack.append((depth + 1, node?.left))
                stack.append((depth + 1, node?.right))
            }
        }
        return depth
    }

}
