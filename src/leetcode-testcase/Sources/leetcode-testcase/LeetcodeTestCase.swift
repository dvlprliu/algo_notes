//
//  LeetcodeTestCase.swift
//  
//
//  Created by zhzh liu on 2022/6/28.
//

import XCTest

open class LeetcodeTestCase: XCTestCase {

    open override func setUpWithError() throws {
    }

    open override func tearDownWithError() throws {
    }

    open func cases<Parameter, Expect: Equatable>() -> [Case<Parameter, Expect>] {
        return []
    }

    open func test<Parameter, Expect: Equatable>(
        cases: [Case<Parameter, Expect>],
        using solution: (Parameter) -> Expect,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        for c in cases {
            test(c, solution: solution, message: nil, file: file, line: line)
        }
    }

    open func test<Parameter, Expect: Equatable>(
        _ case: Case<Parameter, Expect>,
        solution: (Parameter) -> Expect,
        message: String?,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let result = solution(`case`.parameter)
        let message = message ?? "for case: \(`case`.parameter), expect for: \(`case`.expect), but get \(result)"
        XCTAssertEqual(result, `case`.expect, message, file: file, line: line)
    }

}
