//
//  MaxSubArrayTests.swift
//  
//
//  Created by zhzh liu on 2022/6/29.
//

import XCTest
import leetcode_testcase
@testable import dynamic_programming

final class MaxSubArrayTests: LeetcodeTestCase<[Int], Int> {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func cases() -> [Case<[Int], Int>] {
        [
            .init(parameter: [-2,1,-3,4,-1,2,1,-5,4], expect: 6),
            .init(parameter: [1], expect: 1),
            .init(parameter: [5,4,-1,7,8], expect: 23),
        ]
    }

    func testUsingDP() {
        test(using: Solution.MaxSubArray.dp)
        test(using: Solution.MaxSubArray.dpMemOptimal)
    }

    func testUsingSimple() {
        test(using: Solution.MaxSubArray.simple)
    }

}
