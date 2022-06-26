//
//  FindMinTests.swift
//  
//
//  Created by zhzh liu on 2022/6/26.
//

import XCTest
@testable import leetcode_solutions

final class FindMinTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUsingStd() {
        testUsing(solution: Solution.FindMin.usingStd)
    }

    func testByIterate() {
        testUsing(solution: Solution.FindMin.byIterate)
    }

    func testBsearch() {
        testUsing(solution: Solution.FindMin.byBsearch)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

    private func testUsing(solution: @escaping Solution.FindMin.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases = [
            ([1, 3, 1, 1], 1),
            ([3, 3, 3, 1], 1),
            ([3, 1], 1),
            ([1,3,4,5,6], 1),
            ([3,4,5,1,2], 1),
            ([2,2,2,0,1], 0),
            ([2,2,0,1,2], 0),
            ([1,1,1,1,1,1], 1),
            ([2,3,4,1], 1)
        ]
        for `case` in cases {
            test(exp: `case`.1, params: `case`.0, solution: solution, file: file, line: line)
        }
    }

    private func test(
        exp: Int,
        params: [Int],
        solution: @escaping Solution.FindMin.Solution,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let result = solution(params)
        XCTAssertEqual(result, exp, "for \(params) expect \(exp) but get \(result)", file: file, line: line)
    }
}
