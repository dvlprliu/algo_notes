public class ArrayQueue<Item>: Queue {
    private var store: [Item?]
    public let capacity: Int

    private var head = 0
    private var tail = 0

    public init(capacity: Int) {
        self.capacity = capacity
        self.store = [Item?](repeating: nil, count: capacity)
    }

    @discardableResult
    public func enqueue(_ item: Item) -> Bool {
       if tail == capacity {
           if head == 0 { return false }
           for i in head..<tail {
               store[i - head] = store[i]
           }
           tail -= head
           head = 0 
       }
        store[tail] = item
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
