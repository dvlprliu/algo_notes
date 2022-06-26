//
//  ReplaceWhitespaceTest.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import XCTest
@testable import string

final class ReplaceWhitespaceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUseStd() {
        testUsing(solution: Solution.ReplaceWhitespace.useStd)
    }

    func testIterate() {
        testUsing(solution: Solution.ReplaceWhitespace.iterate)
    }

    private func testUsing(solution: Solution.ReplaceWhitespace.Solution, file: StaticString = #filePath, line: UInt = #line) {
        test(exp: "We%20are%20happy.", params: "We are happy.", solution: solution, file: file, line: line)
        test(exp: "%209%20%20", params: " 9  ", solution: solution, file: file, line: line)
        test(exp: "%20%20%20", params: "   ", solution: solution, file: file, line: line)
    }

    private func test(
        exp: String,
        params: String,
        solution: Solution.ReplaceWhitespace.Solution,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let result = solution(params)
        XCTAssertEqual(result, exp, "for \(params) expect \(exp) but get \(result)", file: file, line: line)
    }
}
