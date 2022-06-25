//
//  FindNumberIn2DArrayTests.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import XCTest
@testable import leetcode_solutions

final class FindNumberIn2DArrayTests: XCTestCase {
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testLinearSearch() {
        testUsing(solution: Solution.FindNumberIn2DArray.linearSearch)
    }

    func testFindByRow() {
        testUsing(solution: Solution.FindNumberIn2DArray.findByRow)
    }
    
    private func testUsing(solution: @escaping Solution.FindNumberIn2DArray.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let matrix1 =
        [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
        ]
        test(exp: true, params: (matrix1, 5), solution: solution)
        test(exp: false, params: ([], 4), solution: solution)
        test(exp: false, params: (matrix1, 20), solution: solution)

        let matrix2 = [[-5]]
        test(exp: true, params: (matrix2, -5), solution: solution, file: file, line: line)
    }

    private func test(
        exp: Bool,
        params: ([[Int]], Int),
        solution: @escaping Solution.FindNumberIn2DArray.Solution,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let result = solution(params.0, params.1)
        XCTAssertEqual(result, exp, "for \(params) expect \(exp) but get \(result)", file: file, line: line)
    }
}
