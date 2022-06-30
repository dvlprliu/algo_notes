//
//  MaxProfitWithCoolDownTests.swift
//  
//
//  Created by zhzh liu on 2022/6/30.
//

import XCTest
import leetcode_testcase
@testable import dynamic_programming

final class MaxProfitWithCoolDownTests: LeetcodeTestCase<[Int], Int> {
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    override func cases() -> [Case<[Int], Int>] {
        [
            .init(parameter: [1,2,3,0,2], expect: 3),
            .init(parameter: [1], expect: 0)
        ]
    }

    func testDP() {
        test(using: Solution.MaxProfitWithCoolDown.dp)
        test(using: Solution.MaxProfitWithCoolDown.dpWithMemOpt)
    }

}
