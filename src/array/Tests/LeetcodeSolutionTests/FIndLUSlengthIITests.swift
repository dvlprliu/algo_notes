//
//  FIndLUSlengthIITests.swift
//  
//
//  Created by liuzhuangzhuang01 on 2022/6/27.
//

import XCTest
@testable import leetcode_solutions

class FIndLUSlengthIITests: ArrayTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testUsingBySimple() {
        test(using: Solution.FindLUSlengthII.bySimple)
    }
    
    func test(using solution: Solution.FindLUSlengthII.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases = [
            Case(parameter: ["aba","cdc","eae"], expect: 3),
            Case(parameter: ["aaa", "aaa", "aa"], expect: -1),
        ]
        
        test(cases: cases, using: solution, file: file, line: line)
    }
}
