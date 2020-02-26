class MyCircularQueue {

    var store = [Int?]()
    var capacity = 0

    var head = 0
    var tail = 0

    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        self.capacity = k + 1
        self.store = [Int?](repeating: nil, count: k + 1)
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        store[tail] = value
        tail = (tail + 1) % capacity
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        if isEmpty() { return false }
        let ret = store[head]
        head = (head + 1) % capacity
        return ret != nil
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        return store[head] ?? -1
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        if isEmpty() { return -1 }
        var idx = (tail - 1) % capacity
        if idx < 0 { idx = capacity - 1 }
        return store[idx] ?? -1
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return head == tail
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return ((tail + 1) % capacity == head)
    }
}