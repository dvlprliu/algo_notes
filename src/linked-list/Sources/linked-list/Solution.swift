//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import Foundation

class Solution {
    enum ReversePrint {
        static func stack(_ head: ListNode?) -> [Int] {
            var stack = [Int]()
            var node = head
            while let aNode = node {
                stack.append(aNode.val)
                node = node?.next
            }
            var result = [Int]()
            while let last = stack.popLast() {
                result.append(last)
            }
            return result
        }

        static func recursive(_ head: ListNode?) -> [Int] {
            guard let head = head else { return [] }
            return recursive(head.next) + [head.val]
        }
    }

    enum ReverseList {
        static func byIterate(_ head: ListNode?) -> ListNode? {
            if head == nil || head?.next == nil { return head }
            var pre: ListNode? = nil
            var next = head?.next
            var head = head
            while let newHead = head {
                let newNext = next?.next
                next?.next = head
                head?.next = pre
                pre = newHead
                head = next
                next = newNext
            }
            return pre
        }

        static func byIterateII(_ head: ListNode?) -> ListNode? {
            if head == nil || head?.next == nil {
                return head
            }
            var nodes: (cur: ListNode?, pre: ListNode?) = (head, nil)
            while nodes.cur != nil {
                let tmp = nodes.cur?.next
                nodes.cur?.next = nodes.pre
                nodes.pre = nodes.cur
                nodes.cur = tmp
            }
            return nodes.pre
        }

        static func recursive(_ head: ListNode?) -> ListNode? {
            func recur(_ cur: ListNode?, pre: ListNode?) -> ListNode? {
                if cur == nil { return pre }
                let res = recur(cur?.next, pre: cur)
                cur?.next = pre
                return res
            }
            return recur(head, pre: nil)
        }
    }
}
