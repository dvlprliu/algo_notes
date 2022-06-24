//
//  RemoveDuplicatesSolutionTests.swift
//  
//
//  Created by zhzh liu on 2022/6/24.
//

import XCTest
@testable import leetcode_solutions

final class RemoveDuplicatesSolutionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testBrutal() {
        testUsing(solution: Solution.RemoveDuplicates.brutal)
    }

    func testBrutalOptimal() {
        testUsing(solution: Solution.RemoveDuplicates.brutalOptimal)
    }

    private func testUsing(solution: (inout [Int]) -> Int) {
        test(exp: (2, [1, 2]), params: [1,1,2], solution: solution)
        test(exp: (5, [0,1,2,3,4]), params: [0,0,1,1,1,2,2,3,3,4], solution: solution)
    }

    private func test(exp: (Int, [Int]), params: [Int], solution: ((inout [Int]) -> Int), file: StaticString = #filePath, line: UInt = #line) {
        let expNums = exp.1
        let expK = exp.0
        var params = params
        let result = solution(&params)
        XCTAssertEqual(expK, result, "\(exp) not equal to \(result)", file: file, line: line)
        for i in 0..<expNums.count {
            XCTAssertEqual(params[i], expNums[i], "", file: file, line: line)
        }
    }

}
