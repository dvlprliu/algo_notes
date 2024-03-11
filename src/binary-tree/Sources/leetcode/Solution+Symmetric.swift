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

import binary_tree
import Foundation

extension Solution {
    func isSymmetric_recursive(_ tree: TreeNode?) -> Bool {
        func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil { return true }
            if p == nil || q == nil { return false }
            return p?.value == q?.value && isMirror(p?.left, q?.right) && isMirror(p?.right, q?.left)
        }
        return isMirror(tree?.left, tree?.right)
    }

    /// 判断tree是否是对称的
    /// - Parameter tree: 带判定的二叉树
    /// - Returns: true表明是对称的
    ///
    /// 首先，我们创建一个队列，并将根节点放入队列两次。然后，我们进入一个循环，直到队列为空。在每次循环中，我们从队列中取出两个节点，分别称为 left 和 right。
    ///
    /// 然后，我们进行以下判断：
    ///
    /// 如果 left 和 right 都是 nil，那么我们继续下一次循环。
    /// 如果 left 和 right 其中一个是 nil，那么二叉树就不对称，我们返回 false。
    /// 如果 left 和 right 的值不相等，那么二叉树就不对称，我们返回 false。
    /// 如果以上三个条件都不满足，那么我们将 left 的右子节点和 right 的左子节点，以及 left 的左子节点和 right 的右子节点，依次放入队列。
    ///
    /// 这个过程会一直重复，直到队列为空。如果在整个过程中，我们没有返回 false，那么就说明这个二叉树是对称的，我们返回 true。
    ///
    /// 这个函数的主要思想是，对于一个对称的二叉树，我们从根节点开始，它的左子树和右子树是镜像对称的。也就是说，左子树的左子树和右子树的右子树对称，左子树的右子树和右子树的左子树对称。这就是我们在队列中总是成对放入和取出节点的原因。
    ///
    /// 在该实现中均使用数组模拟栈或者队列，在使用数组模拟的情况下，模拟栈由于都在尾部进行操作所以效率更高。
    ///
    /// 模拟队列的时间复杂度： O(n2),空间复杂度O(n),n为节点个数
    /// 模拟栈的时间复杂度：O(n), 空间复杂度O(n),n为节点个数
    func isSymmetric_iterate(_ tree: TreeNode?) -> Bool {
        guard let node = tree else { return false }
        var stack = [TreeNode?]()
        stack.append(node)
        stack.append(node)
        while !stack.isEmpty {
            let left = stack.removeLast()
            let right = stack.removeLast()
            if left == nil && right == nil { continue }
            if left == nil || right == nil { return false }
            if left?.value != right?.value { return false }
            stack.append(left?.right)
            stack.append(right?.left)
            stack.append(left?.left)
            stack.append(right?.right)
        }
        return true
    }
}
