import Foundation
@testable import leetcode
import XCTest

final class sortingTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        solution = Solution()
    }

    func testMergeIntervals() {
        let cases = [
            // [[case], [answer]]
            [[[1, 4], [0, 0]], [[0, 0], [1, 4]]],
            [[[1, 4], [0, 4]], [[0, 4]]],
            [[[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]], [[1, 10]]]
        ]
        cases.forEach { pair in
            let test = pair[0]
            let ans = pair[1]
            let result = solution.merge(test)
            XCTAssertEqual(result, ans)
        }
    }

    func testSortColors() {
        let cases = [
            [[2, 0, 2, 1, 1, 0], [0, 0, 1, 1, 2, 2]],
            [[2, 0, 1], [0, 1, 2]]
        ]

        cases.forEach { pair in
            let test = pair[0]
            let ans = pair[1]
            var copy = test
            solution.sortColors(&copy)
            XCTAssertEqual(copy, ans)
        }
    }

    func testSortColors_dutchFlag() {
        let cases = [
            [[2, 0, 2, 1, 1, 0], [0, 0, 1, 1, 2, 2]],
            [[2, 0, 1], [0, 1, 2]],
            [[1, 2, 0], [0, 1, 2]]
        ]

        cases.forEach { pair in
            let test = pair[0]
            let ans = pair[1]
            var copy = test
            solution.sortColors_dutchFlag(&copy)
            XCTAssertEqual(copy, ans)
        }
    }
}
