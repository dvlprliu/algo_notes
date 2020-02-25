public class ArrayQueue<Item>: Queue {
    private var store: [Item]
    public let capacity: Int

    private var head = 0
    private var tail = 0

    public init(capacity: Int) {
        self.capacity = capacity
        self.store = [Item]()
    }

    @discardableResult
    public func enqueue(_ item: Item) -> Bool {
        if tail >= capacity { return false }
        store.append(item)
        tail += 1
        return true
    }

    public func dequeue() -> Item? {
        if head == tail { return nil }
        let item = store[head]
        head += 1
        return item
    }

}
