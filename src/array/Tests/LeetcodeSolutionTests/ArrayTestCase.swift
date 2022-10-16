//
//  File.swift
//  
//
//  Created by liuzhuangzhuang01 on 2022/6/27.
//

import XCTest
@testable import leetcode_solutions

protocol TestCase {
    associatedtype Parameter
    associatedtype Expect
    
    var parameter: Parameter { get }
    var expect: Expect { get }
}

struct MutableCase<Parameter, Expect: Equatable> {
    var parameter: Parameter
    var expect: Expect
}

struct Case<Parameter, Expect: Equatable> {
    let parameter: Parameter
    let expect: Expect
}

class ArrayTestCase: XCTestCase {
    
    func test<Parameter, Expect: Equatable>(
        cases: [Case<Parameter, Expect>],
        using solution: (Parameter) -> Expect,
        message: String? = nil,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        for c in cases {
            test(case: c, solution: solution, message: message, file: file, line: line)
        }
    }
    
    func test<Parameter, Expect> (
        case: MutableCase<Parameter, Expect>,
        solution: (Parameter) -> Expect,
        message: String? = nil,
        file: StaticString = #filePath,
        line: UInt = #line
    ) where Expect: Equatable {
        let result = solution(`case`.parameter)
        let expect = `case`.expect
        let message = message ?? "for case \(`case`.parameter) expect \(expect) but get \(result)"
        XCTAssertEqual(expect, result, message, file: file, line: line)
    }
    
    func test<Parameter, Expect>(
        case: Case<Parameter, Expect>,
        solution: (Parameter) -> Expect,
        message: String? = nil,
        file: StaticString = #filePath,
        line: UInt = #line
    ) where Expect: Equatable {
        let result = solution(`case`.parameter)
        let expect = `case`.expect
        let message = message ?? "for case \(`case`.parameter) expect \(expect) but get \(result)"
        XCTAssertEqual(expect, result, message, file: file, line: line)
    }
    
    
    
}
