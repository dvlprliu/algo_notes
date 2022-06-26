//
//  SolutionTests.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import XCTest
@testable import linked_list

final class SolutionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testReversePrint() {
        let list = ListNode(value: 2, next: ListNode(value: 1, next: ListNode(value: 3)))
        let exp = [3, 1, 2]
        let result = Solution.ReversePrint.stack(list)
        XCTAssertTrue(exp.elementsEqual(result), "\(exp) not equal \(result)")
    }

    func testReversePrintByRecursive() {
        let list = ListNode(value: 2, next: ListNode(value: 1, next: ListNode(value: 3)))
        let exp = [3, 1, 2]
        let result = Solution.ReversePrint.recursive(list)
        XCTAssertTrue(exp.elementsEqual(result), "\(exp) not equal \(result)")
    }

}
