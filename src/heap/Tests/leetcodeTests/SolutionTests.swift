//
//  SolutionTests.swift
//  heapTests
//
//  Created by zhzh liu on 4/6/20.
//

import XCTest
@testable import leetcode

class SolutionTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testTopKFrequent() {
        let solution = Solution()
        let cases = [
            ([1,1,1,2,2,3], 2, [1, 2]),
            ([1], 1, [1]),
            ([3,3,3,3,3,3,2,2,2,1,1,23,43,23,24,54,2,1], 3, [3,2,1])
        ]

        let method: [([Int], Int) -> [Int]] = [
            solution.topKFrequent
        ]

        cases.enumerated().forEach { (idx, test) in
            method.enumerated().forEach { (midx, method) in
                let (nums, k, ans)  = test
                let result = method(nums, k)
                XCTAssertEqual(result, ans)
            }
        }
    }

    func testTopKFrequentWords() {
        let solution = Solution()
        let cases = [
            ((["i", "i", "love", "leetcode", "i", "love", "coding"], 2), ["i", "love"])
        ]

        let method: [([String], Int) -> [String]] = [
            solution.topKFrequent
        ]

        cases.enumerated().forEach { (cidx, test) in
            method.enumerated().forEach { (midx, method) in
                let result = method(test.0.0, test.0.1)
                XCTAssertEqual(result, test.1)
            }
        }

    }
}
