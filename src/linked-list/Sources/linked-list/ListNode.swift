//
//  ListNode.swift
//
//
//  Created by zhzh liu on 2022/6/25.
//

import Foundation

public class ListNode: ExpressibleByArrayLiteral {
    public var val: Int
    public var next: ListNode?
    init(value: Int, next: ListNode? = nil) {
        val = value
        self.next = next
    }

    init?(vals: [Int]) {
        if vals.isEmpty { return nil }
        val = vals[0]
        next = ListNode(vals: Array(vals[1 ..< vals.count]))
    }

    public required init(arrayLiteral elements: Int...) {
        if elements.isEmpty { fatalError() }
        val = elements[0]
        next = ListNode(vals: Array(elements[1...]))
    }

    public func last() -> Int? {
        var dummy: ListNode? = self
        var next = self.next
        while next != nil {
            dummy = next
            next = next?.next
        }
        return dummy?.val
    }
}

extension Array where Element == Int {
    func asListNode() -> ListNode? {
        ListNode(vals: self)
    }
}
