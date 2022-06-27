//
//  FindLUSlengthITests.swift
//  
//
//  Created by liuzhuangzhuang01 on 2022/6/27.
//

import XCTest
@testable import leetcode_solutions

final class FindLUSlengthITests: ArrayTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUsingSimple() {
        test(using: Solution.FindLUSlengthI.bySimple)
    }
    
    func test(using solution: Solution.FindLUSlengthI.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases = [
            Case(parameter: ("aba", "cdc"), expect: 3),
            Case(parameter: ("aaa", "bbb"), expect: 3),
            Case(parameter: ("aaa", "aa"), expect: 3),
        ]
        
        test(cases: cases, using: solution, file: file, line: line)
    }
}
