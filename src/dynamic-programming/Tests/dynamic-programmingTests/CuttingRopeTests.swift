//
//  CuttingRopeTests.swift
//  
//
//  Created by liuzhuangzhuang01 on 2022/6/28.
//

import XCTest
@testable import dynamic_programming

class CuttingRopeTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testUsingDynamicProgramming() {
        testUsing(solution: Solution.CuttingRope.byDynamicProgramming)
    }
    
    func testUsingMathmatic() {
        testUsing(solution: Solution.CuttingRope.byMathmatic)
    }
    
    func testLookupTable() {
        testUsing(solution: Solution.CuttingRope.byFindInLookupTable)
    }
    
    func testUsing(solution: Solution.CuttingRope.Solution, file: StaticString = #filePath, line: UInt = #line) {
        let cases = [
            (2, 1),
            (3, 2),
            (4, 4),
            (5, 6),
            (6, 9),
            (7, 12),
            (8, 18),
            (9, 27),
            (10, 36),
            (11, 54),
            (12, 81),
            (13, 108),
            (14, 162),
            (15, 243),
            (16, 324),
            (17, 486),
            (18, 729),
            (19, 972),
            (20, 1458),
            (21, 2187),
            (22, 2916),
            (23, 4374),
            (24, 6561),
            (25, 8748),
            (26, 13122),
            (27, 19683),
            (28, 26244),
            (29, 39366),
            (30, 59049),
            (31, 78732),
            (32, 118098),
            (33, 177147),
            (34, 236196),
            (35, 354294),
            (36, 531441),
            (37, 708588),
            (38, 1062882),
            (39, 1594323),
            (40, 2125764),
            (41, 3188646),
            (42, 4782969),
            (43, 6377292),
            (44, 9565938),
            (45, 14348907),
            (46, 19131876),
            (47, 28697814),
            (48, 43046721),
            (49, 57395628),
            (50, 86093442),
            (51, 129140163),
            (52, 172186884),
            (53, 258280326),
            (54, 387420489),
            (55, 516560652),
            (56, 774840978),
            (57, 1162261467),
            (58, 1549681956),
        ]
        
        for c in cases {
            test(expect: c.1, parameter: c.0, solution: solution, file: file, line: line)
        }
    }
    
    func test<Expect: Equatable, Parameter>(
        expect: Expect,
        parameter: Parameter,
        solution: (Parameter) -> Expect,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let result = solution(parameter)
        XCTAssertEqual(result, expect, file: file, line: line)
    }
}
