//
//  PriorityQueue.swift
//  heap
//
//  Created by zhzh liu on 4/6/20.
//
//  Credit: SwiftAlgorithmClub

import Foundation

public struct PriorityQueue<T> {
    private(set) var heap: Heap<T>

    public init(sort: @escaping (T, T) -> Bool) {
        self.heap = Heap<T>(sort: sort)
    }

    public var count: Int {
        heap.count
    }

    public var isEmpty: Bool {
        heap.isEmpty
    }

    public func peek() -> T? {
        heap.peek()
    }

    public mutating func enqueue(_ value: T) {
        heap.insert(value)
    }

    @discardableResult
    public mutating func dequeue() -> T? {
        heap.remove()
    }

    public mutating func changePriority(index: Int, value: T) {
        heap.replace(index: index, value: value)
    }
}
