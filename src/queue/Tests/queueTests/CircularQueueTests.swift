import XCTest
@testable import queue

class CircularQueueTests: XCTestCase {
  override func setUp() {
  }

  override func tearDown() {
  }
  
  func testEnqueue() {
    let queue = CircularQueue<Int>(capacity: 5)
    var ops = [
    queue.enqueue(123),
    queue.enqueue(456),
    queue.enqueue(789),
    queue.enqueue(666)
    ]
    XCTAssertEqual(ops, [Bool](repeating: true, count: 4))
    XCTAssertEqual(queue.dequeue(), 123)
    XCTAssertEqual(queue.dequeue(), 456)
    XCTAssertEqual(queue.dequeue(), 789)

    ops = [
      queue.enqueue(333),
      queue.enqueue(555),
      queue.enqueue(777),
      queue.enqueue(888),
      queue.enqueue(999)
    ]
    XCTAssertEqual(ops, [true, true, true, false, false])
    XCTAssertEqual(queue.dequeue(), 666)  
    XCTAssertEqual(queue.dequeue(), 333)
    XCTAssertEqual(queue.dequeue(), 555)
    XCTAssertEqual(queue.dequeue(), 777)
    XCTAssertNil(queue.dequeue())
  }
}