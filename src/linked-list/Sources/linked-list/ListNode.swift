//
//  LinkedList.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    init(value: Int, next: ListNode? = nil) {
        self.val = value
        self.next = next
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
