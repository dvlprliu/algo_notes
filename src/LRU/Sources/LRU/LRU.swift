private class ListNode {
    let val: (Int, Int)
    var next: ListNode?
    init(val: (Int, Int)) {
        self.val = val
        self.next = nil
    }
}
public class LRU {
    private let capacity: Int
    private var list: ListNode? = ListNode(val: (-1, -1))
    private var count = 0
    init(capacity: Int) {
        self.capacity = capacity
    }

    func get(key: Int) -> Int? {
        var cur = list
        while cur != nil {
            if cur?.val.0 == key {
                return cur?.val.1
            }
            cur = cur?.next
        }
        return nil
    }

    func put(key: Int, value: Int) {
        // 检查capacity
        // 如果存满，删除最早为使用
        if count >= capacity {
            list?.next = list?.next?.next
            list?.next?.next = nil
        }
        // 如果没有存在，现在当前表中查找是否已经存在，如果已经存在，将它移到链表最后
        var cur = list
        var newNode: ListNode?
        while let next = cur?.next  {
            if next.val.0 == key {
                cur?.next = next.next
                newNode = next
                break
            }
            cur = cur?.next
        }
        // 如果没有找到
        if newNode == nil {
            newNode = ListNode(val: (key, value))
        }
        while cur?.next != nil {
            cur = cur?.next
        }
        count += 1
        cur?.next = newNode
    }
}

