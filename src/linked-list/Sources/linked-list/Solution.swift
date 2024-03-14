//
//  Solution.swift
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
            var pre: ListNode?
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
            var pre: ListNode?
            var cur = head
            while cur != nil {
                let next = cur?.next
                cur?.next = pre
                pre = cur
                cur = next
            }
            return pre
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

        static func recursiveSimple(_ head: ListNode?) -> ListNode? {
            if head == nil || head?.next == nil {
                return head
            }
            let ret = recursiveSimple(head?.next)
            head?.next?.next = head
            head?.next = nil
            return ret
        }
    }

    enum MergeTwoLists {
        typealias Solution = (ListNode?, ListNode?) -> ListNode?
        static func byIterate(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil { return l2 }
            if l2 == nil { return l1 }
            var newList: ListNode?
            var head = newList
            var l1N = l1
            var l2N = l2
            while let l = l1N, let r = l2N {
                var lower: ListNode?
                if l.val <= r.val {
                    lower = l
                    l1N = l1N?.next
                } else {
                    lower = r
                    l2N = l2N?.next
                }
                if newList == nil {
                    newList = lower
                    head = lower
                } else {
                    newList?.next = lower
                    newList = lower
                }
            }
            if l1N != nil {
                newList?.next = l1N
            } else {
                newList?.next = l2N
            }
            return head
        }

        static func byRecursive(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil {
                return l2
            } else if l2 == nil {
                return l1
            } else if l1!.val <= l2!.val {
                l1?.next = byRecursive(l1?.next, l2)
                return l1
            } else {
                l2?.next = byRecursive(l1, l2?.next)
                return l2
            }
        }
    }
}
