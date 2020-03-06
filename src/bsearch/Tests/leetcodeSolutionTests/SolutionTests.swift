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

    func testMySqrt() {
        let cases = [
            (4, 2),
            (8, 2),
            (64, 8),
            (2, 1),
            (0, 0)
        ]
        let randomTest = (0..<10).map { (_) -> (Int, Int) in
            let num = Int.random(in: 123...1245)
            let ans = Int(floor(sqrtf(Float(num))))
            return (num, ans)
        }
        let solution = Solution()
        (cases + randomTest).forEach { (case) in
            let (x, n) = `case`
            XCTAssertEqual(solution.mySqrt(x), n)
        }
    }
}


