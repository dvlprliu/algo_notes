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
}
