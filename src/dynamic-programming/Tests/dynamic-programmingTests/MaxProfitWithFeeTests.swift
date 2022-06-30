//
//  MaxProfitWithFeeTests.swift
//  
//
//  Created by zhzh liu on 2022/6/30.
//

import XCTest
import leetcode_testcase
@testable import dynamic_programming

final class MaxProfitWithFeeTests: LeetcodeTestCase<([Int], Int), Int> {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    override func cases() -> [Case<([Int], Int), Int>] {
        [
            .init(parameter: ([1, 3, 2, 8, 4, 9], 2), expect: 8),
            .init(parameter: ([1,3,7,5,10,3], 3), expect: 6),
        ]
    }

    func testDP() {
        test(using: Solution.MaxProfitWithFee.dp)
    }

}
