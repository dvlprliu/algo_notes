//
//  ArrayQueuetTests.swift
//  queueTests
//
//  Created by zhzh liu on 2/25/20.
//

import XCTest
@testable import queue

class ArrayQueueTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testEnqueue() {
        let queue = ArrayQueue<Int>(capacity: 4)
        var result = [Bool]()
        for i in 0...4 {
            result.append(queue.enqueue(i))
        }
        XCTAssertEqual([true, true, true, true, false], result)
    }

    func testDequeue() {
        let queue = ArrayQueue<Int>(capacity: 4)
        // dequeue on an empty queue should get nil
        XCTAssertNil(queue.dequeue())
        let expects = [1,2,3,4]
        for num in expects {
            queue.enqueue(num)
        }
        var result = [Int?]()
        for _ in 0...4 {
            result.append(queue.dequeue())
        }
        XCTAssertEqual(result, expects + [nil])
    }

    static var allTests = [
        ("testEnqueue", testEnqueue),
        ("testDequeue", testDequeue)
    ]
}
