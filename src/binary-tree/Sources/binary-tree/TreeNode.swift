//
//  TreeNode.swift
//  binary-tree
//
//  Created by zhzh liu on 4/1/20.
//

import Foundation

public class TreeNode<Value> {
    public let value: Value
    public var left: TreeNode?
    public var right: TreeNode?

    init(value: Value) {
        self.value = value
        left = nil
        right = nil
    }

    func levelOrderTraversel() -> [Value] {
        var queue = [self]
        var result = [Value]()
        while !queue.isEmpty {
            while queue.count > 0 {
                let top = queue.removeFirst()
                result.append(top.value)
                if let left = top.left {
                    queue.append(left)
                }
                if let right = top.right {
                    queue.append(right)
                }
            }
        }
        return result
    }

    func inorderTraversel_recursive() -> [Value] {
        (left?.inorderTraversel_recursive() ?? [])
            + [value]
            + (right?.inorderTraversel_recursive() ?? [])
    }

    func inorderTraversel_iterate() -> [Value] {
        var cur: TreeNode? = self
        var stack = [TreeNode]()
        var result = [Value]()
        while !stack.isEmpty || cur != nil {
            while let node = cur {
                stack.append(node)
                cur = cur?.left
            }
            let top = stack.popLast()
            if let value = top?.value {
                result.append(value)
            }
            cur = top?.right
        }
        return result
    }

    func preorderTraversel_recursive() -> [Value] {
        [value] + (left?.preorderTraversel_recursive() ?? []) + (right?.preorderTraversel_recursive() ?? [])
    }

    func preorderTraversel_iterate() -> [Value] {
        var result = [Value]()
        var stack = [self]
        while !stack.isEmpty {
            let top = stack.removeLast()
            result.append(top.value)
            if let left = left {
                stack.append(left)
            }
            if let right = right {
                stack.append(right)
            }
        }
        return result
    }

    func postorderTraversel_recursive() -> [Value] {
        (left?.postorderTraversel_recursive() ?? [])
            + (right?.postorderTraversel_recursive() ?? [])
            + [value]
    }

    func postorderTraversel_iterate() -> [Value] {
        var stack = [self]
        var result = [Value]()
        while !stack.isEmpty {
            let top = stack.removeLast()
            result.append(top.value)
            if let left = left {
                stack.append(left)
            }
            if let right = right {
                stack.append(right)
            }
        }
        return result.reversed()
    }

    static func tree(from valuesInLevelOrder: [Value?]) -> TreeNode<Value>? {
        if valuesInLevelOrder.isEmpty { return nil }
        func buildTree(from values: [Value?], idx: Int) -> TreeNode? {
            if idx >= values.count { return nil }
            guard let val = values[idx] else { return nil }
            let root = TreeNode(value: val)
            root.left = buildTree(from: values, idx: 2 * idx + 1)
            root.right = buildTree(from: values, idx: 2 * idx + 2)
            return root
        }
        return buildTree(from: valuesInLevelOrder, idx: 0)
    }

    func map<T>(_ transform: (Value) throws -> T) rethrows -> TreeNode<T>? {
        func traverseAndMap(_ node: TreeNode<Value>?, _ transform: (Value) throws -> T) rethrows -> TreeNode<T>? {
            guard let node = node else { return nil }
            let root = try TreeNode<T>(value: transform(node.value))
            root.left = try traverseAndMap(node.left, transform)
            root.right = try traverseAndMap(node.right, transform)
            return root
        }
        return try traverseAndMap(self, transform)
    }
}

extension TreeNode: CustomStringConvertible where Value: CustomStringConvertible {
    public var description: String {
        return ""
    }
}

extension Array {
    func tree() -> TreeNode<Element>? {
        TreeNode.tree(from: self)
    }
}
