//
//  FindPathInMatrixTests.swift
//  
//
//  Created by zhzh liu on 2022/6/26.
//

import XCTest
@testable import leetcode_solutions

struct Case<Parameter, Expect: Equatable> {
    let param: Parameter
    let expect: Expect
}

final class FindPathInMatrixTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testByBacktracing() {
        testUsing(solution: Solution.FindPathInMatrix.byBacktrace)
    }

    func testUsing(solution: Solution.FindPathInMatrix.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases: [Case<([[Character]], String), Bool>] = [
            .init(param: ([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), expect: true),
            .init(param: ([["a","b"],["c","d"]], "abcd"), expect: false),
            .init(param: ([["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","B"],["A","A","A","A","B","A"]], "AAAAAAAAAAAAABB"), expect: false)
        ]
        for c in cases {
            test(exp: c.expect, params: c.param, solution: solution, file: file, line: line)
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
