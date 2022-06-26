//
//  ListNodeTests.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import XCTest
@testable import linked_list

final class ListNodeTests: XCTestCase {

    var list: ListNode!

    override func setUpWithError() throws {
        list = ListNode(value: 1, next: ListNode(value: 2, next: ListNode(value: 3)))
    }

    override func tearDownWithError() throws {
    }

    func testLast() {
        let singleNode = ListNode(value: 1)
        XCTAssertEqual(singleNode.last(), 1)
    }

    func testInitFromArray() {
        let empty: [Int] = []
        XCTAssertNil(ListNode(vals: empty))

        let arrayList: ListNode = [1, 2, 3]
        XCTAssertEqual(arrayList.last(), 3)
    }
}
