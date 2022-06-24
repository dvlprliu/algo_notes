//
//  SolutionTests.swift
//  
//
//  Created by zhzh liu on 2022/6/24.
//

import XCTest
@testable import leetcode_solutions

final class SolutionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testTowSum_brutalForce() {
        let solution = Solution.TwoSum.brutalForce
        testTwoSumUsingSolution(solution: solution)
    }

    func testTowSum_brutalForceV2() {
        let solution = Solution.TwoSum.brutalForceV2
        testTwoSumUsingSolution(solution: solution)
    }

    func testTowSum_usingHashMap() {
        let solution = Solution.TwoSum.usingHashMap
        testTwoSumUsingSolution(solution: solution)
    }

    func testTowSum_usingHashMapV2() {
        let solution = Solution.TwoSum.usingHashMapV2
        testTwoSumUsingSolution(solution: solution)
    }

    func testTwoSumUsingSolution(solution: (([Int], Int) -> [Int])) {
        test(exp: [0, 1], params: ([2,7,11,15], 9), solution: solution)
        test(exp: [1, 2], params: ([3,2,4], 6), solution: solution)
        test(exp: [0, 1], params: ([3,3], 6), solution: solution)
    }

    private func test(exp: [Int], params: ([Int], Int), solution: (([Int], Int) -> [Int]), file: StaticString = #filePath, line: UInt = #line) {
        let result = solution(params.0, params.1)
        XCTAssertEqual(Set(exp), Set(result), "\(exp) not equal to \(result)", file: file, line: line)
    }

}
