//
//  SkipList.swift
//  skiplist
//
//  Created by zhzh liu on 3/10/20.
//
// SkipList
//
// +----+                       +----+----+                                                                                           +-----+
// |    |---------------------->|    |    |------------------------------------------------------------------------------------------>|     |
// +----+                       |    +----+                                                                          +----+----+      |     |
// |    |---------------------->|    |    |------------------------------------------------------------------------->|    |    |----->|     |
// +----+                       | 7  +----+                       +----+----+                                        |    +----+      | nil |
// |    |---------------------->|    |    |---------------------->|    |    |--------------------------------------->| 37 |    |----->|     |
// +----+      +----+----+      |    +----+      +----+----+      | 19 +----+      +----+----+      +----+----+      |    +----+      |     |
// |    |----->| 3  |    |----->|    |    |----->| 11 |    |----->|    |    |----->| 22 |    |----->| 26 |    |----->|    |    |----->|     |
// +----+      +----+----+      +----+----+      +----+----+      +----+----+      +----+----+      +----+----+      +----+----+      +-----+
//

import Foundation

class SkipList {
    static let MAX_LEVEL = 16
    static let SKIPLIST_P = 0.5

    private var head = Node(value: Int.min)
    private var levelCount = 1

    func find(_ value: Int) -> Bool {
        var cur: Node? = head
        for i in (0...levelCount - 1) {
            while cur?.forwards[i] != nil && (cur?.forwards[i]?.value ?? Int.max) < value {
                cur = cur?.forwards[i]
            }
        }
        if cur?.forwards[0] != nil && cur?.forwards[0]?.value == value {
            return true
        } else {
            return false
        }
    }

    func insert(_ value: Int) {
        let level = randomLevel()
        let newNode = Node(value: value)
        newNode.maxLevel = level
        var update = [Node?](repeating: head, count: level)

        var p: Node? = head
        for i in (0...level - 1).reversed() {
            while p?.forwards[i] != nil && (p?.forwards[i]?.value ?? Int.max) < value {
                p = p?.forwards[i]
            }
            update[i] = p
        }

        for i in 0..<level {
            newNode.forwards[i] = update[i]?.forwards[i]
            update[i]?.forwards[i] = newNode
        }

        if levelCount < level { levelCount = level }
    }

    func delete(_ value: Int) {
        var update = [Node?](repeating: nil, count: levelCount)
        var cur: Node? = head
        for i in (0...levelCount - 1).reversed() {
            while cur?.forwards[i] != nil && cur?.forwards[i]?.value ?? Int.max < value {
                cur = cur?.forwards[i]
            }
            update[i] = cur
        }
        while cur?.forwards[0] != nil && cur?.forwards[0]?.value == value {
            for i in (0...levelCount - 1).reversed() {
                if update[i]?.forwards[i] != nil && update[i]?.forwards[i]?.value == value {
                    update[i]?.forwards[i] = update[i]?.forwards[i]?.forwards[i]
                }
            }
        }
        while levelCount > 1 && head.forwards[levelCount] == nil {
            levelCount -= 1
        }
    }

    private func randomLevel() -> Int {
        var level = 1
        while Double.random(in: 0...1) < SkipList.SKIPLIST_P && level <= SkipList.MAX_LEVEL {
            level += 1
        }
        return level
    }

    class Node {
        var value: Int
        var forwards = [Node?](repeating: nil, count: SkipList.MAX_LEVEL)
        var maxLevel: Int = 0
        init(value: Int) {
            self.value = value
        }
    }
}

extension SkipList {
    func prettyPrint() {
        var p: Node? = head
        while p?.forwards[0] != nil {
            print("\(p?.forwards[0]) ")
            p = p?.forwards[0]
        }
    }
}

extension SkipList.Node: CustomStringConvertible {
    var description: String {
        return " { data: \(value); levels: \(maxLevel) } "
    }
}
