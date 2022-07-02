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

    func testReverseList() {
        testReverseList(using: Solution.ReverseList.byIterate)
        testReverseList(using: Solution.ReverseList.byIterateII)
        testReverseList(using: Solution.ReverseList.recursive)
    }

    func testReverseList(using solution: (ListNode?) -> ListNode?, file: StaticString = #filePath, line: UInt = #line) {
        let cases: [(param: ListNode?, exp: ListNode?)] = [
            ([1,2,3], [3,2,1]),
            ([1], [1]),
        ]
        for c in cases {
            let result = solution(c.param)
            let expect = c.exp
            var check: (ListNode?, ListNode?) = (result, expect)
            while let r = check.0, let e = check.1 {
                XCTAssertEqual(r.val, e.val, file: file, line: line)
                check.0 = check.0?.next
                check.1 = check.1?.next
            }
            XCTAssertTrue(check.0 == nil && check.1 == nil,  file: file, line: line)
        }
    }

}
