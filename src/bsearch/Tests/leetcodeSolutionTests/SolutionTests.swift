//
//  SolutionTests.swift
//  bsearch
//
//  Created by zhzh liu on 3/6/20.
//

import XCTest
@testable import leetcodeSolution

final class SolutionTests: XCTestCase {
    override func setUp() {

    }

    override class func tearDown() {

    }

    func testSearchInsertPosition() {
        let cases = [
            ([1,3,5,6], 5, 2),
            ([1,3,5,6], 2, 1),
            ([1,3,5,6], 7, 4),
            ([1,3,5,6], 0, 0)
        ]
        let solution = Solution()
        cases.forEach { (`case`) in
            let (nums, target, ans) = `case`
            let p = solution.searchInsert(nums, target)
            XCTAssertEqual(p, ans)
        }
    }
}


