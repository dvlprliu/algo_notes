//
//  SolutionTests.swift
//
//
//  Created by zhzh liu on 2022/6/25.
//

@testable import linked_list
import XCTest

final class SolutionTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

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
        testReverseList(using: Solution.ReverseList.recursiveSimple)
    }

    func testReverseList(using solution: (ListNode?) -> ListNode?, file: StaticString = #filePath, line: UInt = #line) {
        let cases: [(param: ListNode?, exp: ListNode?)] = [
            ([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
            ([1, 2, 3], [3, 2, 1]),
            ([1], [1]),
        ]
        for c in cases {
            XCTAssertListEqual(solution(c.param), c.exp, file: file, line: line)
        }
    }

    func testMergeList() {
        testMergeList(using: Solution.MergeTwoLists.byIterate)
        testMergeList(using: Solution.MergeTwoLists.byRecursive)
    }

    func testMergeList(using solution: Solution.MergeTwoLists.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases: [(param: ([Int], [Int]), expect: [Int])] = [
            (([1, 2, 4], [1, 3, 4]), [1, 1, 2, 3, 4, 4]),
            (([1, 2, 3], []), [1, 2, 3]),
            (([], [1, 2, 3]), [1, 2, 3]),
            (([1], [1, 2, 3]), [1, 1, 2, 3]),
        ]
        for c in cases {
            let l1 = c.param.0.asListNode()
            let l2 = c.param.1.asListNode()
            let expect = c.expect.asListNode()
            XCTAssertListEqual(solution(l1, l2), expect, file: file, line: line)
        }
    }

    func XCTAssertListEqual(
        _ list1: @autoclosure () -> ListNode?,
        _ list2: @autoclosure () -> ListNode?,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        var check: (result: ListNode?, expect: ListNode?) = (list1(), list2())
        while let r = check.result, let e = check.expect {
            XCTAssertEqual(r.val, e.val, message(), file: file, line: line)
            check.0 = check.0?.next
            check.1 = check.1?.next
        }
        XCTAssertTrue(check.0 == nil && check.1 == nil, message(), file: file, line: line)
    }
}
