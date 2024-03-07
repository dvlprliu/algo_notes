
public class LRUCache {
    private let capacity: Int
    private var count: Int = 0
    private var values: [Int: Container] = [:]
    private unowned(unsafe) var head: Container?
    private unowned(unsafe) var tail: Container?

    public init(_ capacity: Int) {
        self.capacity = capacity
    }

    public func get(_ key: Int) -> Int {
        guard let container = values[key] else {
            return -1
        }

        let value = container.value
        remove(container)
        append(container)
        return value
    }

    public func put(_ key: Int, _ value: Int) {
        // 检查是否已经存在该值
        if let container = values[key] {
            container.value = value
            remove(container)
            append(container)
        } else {
            let container = Container(key, value)
            values[key] = container
            append(container)
            count += 1
        }
        clean()
    }
}

extension LRUCache {
    class Container {
        let key: Int
        var value: Int
        unowned(unsafe) var prev: Container?
        unowned(unsafe) var next: Container?

        init(_ key: Int, _ value: Int, prev: Container? = nil, next: Container? = nil) {
            self.key = key
            self.value = value
            self.prev = prev
            self.next = next
        }
    }

    func remove(_ container: Container) {
        if head === container {
            head = container.next
        }
        if tail === container {
            tail = container.prev
        }
        container.prev?.next = container.next
        container.next?.prev = container.prev
        container.next = nil
    }

    func append(_ container: Container) {
        if head == nil {
            head = container
        }
        tail?.next = container
        container.prev = tail
        tail = container
    }

    private func clean() {
        while count > capacity, let container = head {
            remove(container)
            values.removeValue(forKey: container.key)
            count -= 1
        }
    }
}
