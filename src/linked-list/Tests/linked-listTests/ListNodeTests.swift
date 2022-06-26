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
        let last = list.last()
        XCTAssertEqual(last, 3)

        let emptyList: ListNode? = nil
        XCTAssertNil(emptyList?.last())

        let singleNode = ListNode(value: 1)
        XCTAssertEqual(singleNode.last(), 1)
    }

}
