//
//  FindPathInMatrixTests.swift
//  
//
//  Created by zhzh liu on 2022/6/26.
//

import XCTest
@testable import leetcode_solutions

final class FindPathInMatrixTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testByBacktracing() {
        testUsing(solution: Solution.FindPathInMatrix.byBacktrace)
    }

    func testUsing(solution: Solution.FindPathInMatrix.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases: [Case<([[Character]], String), Bool>] = [
            .init(parameter: ([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), expect: true),
            .init(parameter: ([["a","b"],["c","d"]], "abcd"), expect: false),
            .init(parameter: ([["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","B"],["A","A","A","A","B","A"]], "AAAAAAAAAAAAABB"), expect: false)
        ]
        for c in cases {
            test(exp: c.expect, params: c.parameter, solution: solution, file: file, line: line)
        }
    }

    private func test<Expect, Parameter>(
        exp: Expect,
        params: Parameter,
        solution: (Parameter) -> Expect,
        file: StaticString = #filePath,
        line: UInt = #line
    ) where Expect: Equatable {
        let result = solution(params)
        XCTAssertEqual(exp, result, "for \(params) expect \(exp) but get \(result)", file: file, line: line)
    }

}
