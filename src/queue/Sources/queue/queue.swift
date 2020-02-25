public protocol Queue {
    associatedtype Item
    @discardableResult
    func enqueue(_ item: Item) -> Bool
    func dequeue() -> Item?
}
