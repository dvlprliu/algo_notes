//
//  MaxProfitIIITests.swift
//  
//
//  Created by zhzh liu on 2022/6/30.
//

import XCTest
import leetcode_testcase
@testable import dynamic_programming

final class MaxProfitIIITests: LeetcodeTestCase<[Int], Int> {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    override func cases() -> [Case<[Int], Int>] {
        [
            .init(parameter: [3,3,5,0,0,3,1,4], expect: 6),
            .init(parameter: [1,2,3,4,5], expect: 4),
            .init(parameter: [7,6,4,3,1] , expect: 0),
            .init(parameter: [1], expect: 0),
        ]
    }

    func testDP() {
        test(using: Solution.MaxProfitIII.dp)
    }
    
}
