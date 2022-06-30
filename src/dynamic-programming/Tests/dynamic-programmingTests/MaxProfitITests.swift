//
//  MaxProfitI.swift
//  
//
//  Created by zhzh liu on 2022/6/28.
//

import XCTest
import leetcode_testcase
@testable import dynamic_programming

final class MaxProfitI: LeetcodeTestCase<[Int], Int> {

    typealias ProfitCase = Case<[Int], Int>

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testUsingSimpleSolution() {
        test(using: Solution.MaxProfitI.simple)
    }

    func testDP() {
        test(using: Solution.MaxProfitI.dp)
    }

    override func cases() -> [ProfitCase] {
        return [
            .init(parameter: [7,1,5,3,6,4], expect: 5),
            .init(parameter: [7,6,4,3,1], expect: 0),
            .init(parameter: [2,4,1], expect: 2),
        ]
    }
}
