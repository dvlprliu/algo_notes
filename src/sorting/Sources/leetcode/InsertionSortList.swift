/*
 * @lc app=leetcode.cn id=147 lang=swift
 *
 * [147] 对链表进行插入排序
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
extension Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(Int.min)
        var pre: ListNode? = dummy
        var tail: ListNode? = dummy
        var cur = head
        while cur != nil {
            if tail!.val < cur!.val {
                tail?.next = cur
                tail = cur
                cur = cur?.next
            } else {
                let tmp = cur?.next
                tail?.next = cur?.next
                while pre?.next != nil, pre!.next!.val < cur!.val {
                    pre = pre?.next
                }
                cur?.next = pre?.next
                pre?.next = cur
                pre = dummy
                cur = tmp
            }
        }
        return dummy.next
    }
}

// @lc code=end
