import XCTest
@testable import leetcode

class MyCircularQueueTests: XCTestCase {
  override func setUp() {}
  override func tearDown() {}

  func testEnqueue() {
    let queue = MyCircularQueue(3)
     XCTAssertEqual(queue.enQueue(1), true)
     XCTAssertEqual(queue.enQueue(2), true)
     XCTAssertEqual(queue.enQueue(3), true)
     XCTAssertEqual(queue.enQueue(4), false)
     XCTAssertEqual(queue.Rear(), 3)
     XCTAssertEqual(queue.isFull(), true)
     XCTAssertEqual(queue.deQueue(), true)
     XCTAssertEqual(queue.enQueue(4), true)
     XCTAssertEqual(queue.Rear(), 4)
  }
}