
public class CircularQueue<Item>: Queue {
  private var store: [Item?]
  private let capacity: Int
  private var head = 0
  private var tail = 0

  public init(capacity: Int) {
    self.capacity = capacity
    self.store = [Item?](repeating: nil, count: capacity)
  }
  
  public func enqueue(_ item: Item) -> Bool {
    if ((tail + 1) % capacity == head) { return false }
    store[tail] = item
    tail = (tail + 1) % capacity
    return true
  }

  public func dequeue() -> Item? {
    if tail == head { return nil }
    let ret = store[head]
    head = (head + 1) % capacity
    return ret
  }
}