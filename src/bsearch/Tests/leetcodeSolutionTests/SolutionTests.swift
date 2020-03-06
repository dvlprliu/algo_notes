//
//  SolutionTests.swift
//  bsearch
//
//  Created by zhzh liu on 3/6/20.
//

@testable import leetcodeSolution
import XCTest

final class SolutionTests: XCTestCase {
    override func setUp() {}

    override class func tearDown() {}

    func testSearchInsertPosition() {
        let cases = [
            ([1, 3, 5, 6], 5, 2),
            ([1, 3, 5, 6], 2, 1),
            ([1, 3, 5, 6], 7, 4),
            ([1, 3, 5, 6], 0, 0)
        ]
        let solution = Solution()
        cases.forEach { `case` in
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
            (0, 0),
            (1, 1)
        ]
        let randomTest = (0..<10).map { (_) -> (Int, Int) in
            let num = Int.random(in: 123...1245)
            let ans = Int(floor(sqrtf(Float(num))))
            return (num, ans)
        }
        let solution = Solution()
        (cases + randomTest).forEach { `case` in
            let (x, n) = `case`
            XCTAssertEqual(solution.mySqrt(x), n)
        }
    }

    func testSearchRotatedSortedArray() {
        let cases = [
            ([4, 5, 6, 7, 0, 1, 2], 0, 4),
            ([4, 5, 6, 7, 0, 1, 2], 3, -1),
            ([6, 7, 0, 1, 2, 4, 5], 2, 4),
            ([6, 7, 0, 1, 2, 4, 5], 8, -1),
            ([0, 1, 2, 4, 5, 6, 7], 2, 2),
            ([6, 7, 0, 1, 2, 4, 5], 3, -1),
            ([3, 1], 1, 1)
        ]
        let solution = Solution()
        cases.forEach { `case` in
            let (nums, target, ans) = `case`
            let result = solution.search(nums, target)
            XCTAssertEqual(result, ans, "searching \(target) in \(nums) should be \(ans) but get \(result)")
        }
    }

    func testSearchMatrix() {
        let cases = [
            ([
                [1, 3, 5, 7],
                [10, 11, 16, 20],
                [23, 30, 34, 50]
            ], 3, true),
            ([
                [1, 3, 5, 7],
                [10, 11, 16, 20],
                [23, 30, 34, 50]
            ], 8, false),
            ([
                [1], [3], [5]
            ], 5, true),
            ([
                [1], [3]
            ], 3, true),
            ([
                []
            ], 3, false)
        ]

        let solution = Solution()
        var count = 0
        cases.forEach { `case` in
            print("testing case \(count)")
            let (matrix, target, ans) = `case`
            XCTAssertEqual(solution.searchMatrix(matrix, target), ans)
            count += 1
        }
    }
}
