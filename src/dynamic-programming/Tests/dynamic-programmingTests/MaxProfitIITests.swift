//
//  MaxProfitIITests.swift
//  
//
//  Created by zhzh liu on 2022/6/29.
//

import XCTest
import leetcode_testcase
@testable import dynamic_programming

final class MaxProfitIITests: LeetcodeTestCase<[Int], Int> {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    override func cases() -> [Case<[Int], Int>] {
        [
            .init(parameter: [7,1,5,3,6,4], expect: 7),
            .init(parameter: [1,2,3,4,5], expect: 4),
            .init(parameter: [7,6,4,3,1], expect: 0),
        ]
    }

    func testSimple() {
        test(using: Solution.MaxProfitII.simple)
    }

    func testDP() {
        test(using: Solution.MaxProfitII.dp)
        test(using: Solution.MaxProfitII.dpWithMemOptimal)
    }
}
