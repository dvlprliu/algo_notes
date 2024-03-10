//
//  LeetcodeTests.swift
//  binary-treeTests
//
//  Created by zhzh liu on 4/1/20.
//

@testable import binary_tree
@testable import leetcode
import XCTest

class LeetcodeTests: XCTestCase {
    struct Case<Value, Expect> {
        let value: Value
        let expect: Expect

        init(_ value: Value, _ expect: Expect) {
            self.value = value
            self.expect = expect
        }
    }

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testSameTree() {
        let solution = Solution()
        let cases = [
            (([1, nil, 2], [1, nil, 2]), true),
            (([1, 2, 3], [1, 2, 3]), true),
            (([1, 2], [1, nil, 2]), false),
            (([1, 2, 1], [1, 1, 2]), false),
            (([], []), true),
        ].map(Case<([Int?], [Int?]), Bool>.init)

        let methods = [
            solution.sameTree,
        ]

        testHelper_(cases: cases, methods: methods) { cases, method -> (Bool, Bool) in
            let c = cases
            let p = TreeNode.tree(from: cases.value.0)
            let q = TreeNode.tree(from: cases.value.1)
            let result = method(p, q)
            return (c.expect, result)
        }
    }

    func testIsSymmetric() {
        let solution = Solution()
        let cases = [
            ([1, 2, 2, 3, 4, 4, 3], true),
            ([1, 2, 2, nil, 3, nil, 3], false),
        ].map(Case<[Int?], Bool>.init)

        let methods = [
            solution.isSymmetric_recursive,
            solution.isSymmetric_iterate,
        ]

        testHelper_(cases: cases, methods: methods) { cs, method -> (Bool, Bool) in
            let tree = TreeNode.tree(from: cs.value)
            let result = method(tree)
            return (cs.expect, result)
        }
    }

    func testMaxDepth() {
        let solution = Solution()
        let cases = [
            ([3, 9, 20, nil, nil, 15, 7], 3),
            ([1, 2, 3, 4, 5], 3),
        ].map(Case<[Int?], Int>.init)

        let methods = [
            solution.maxDepth_recursive,
            solution.maxDepth_iterate,
        ]

        testHelper_(cases: cases, methods: methods) { c, method -> (Int, Int) in
            let input = c.value
            let output = c.expect
            let tree = TreeNode.tree(from: input)
            let resu = method(tree)
            return (output, resu)
        }
    }

    func testHelper_<Input, Output, Method, Value>(
        cases: [Case<Input, Output>],
        methods: [Method],
        solution: StaticString = #function,
        line: UInt = #line,
        file: StaticString = #file,
        test: (Case<Input, Output>, Method) -> (expect: Value, result: Value)
    ) where Value: Equatable {
        for (cidx, cs) in cases.enumerated() {
            for (midx, method) in methods.enumerated() {
                let (ans, res) = test(cs, method)
                XCTAssertEqual(ans, res, "solution <\(solution)> failed for case #\(cidx): \(cs) using method #\(midx)", file: file, line: line)
            }
        }
    }

    func testHelper<Case, Method, Value>(
        cases: [Case],
        methods: [Method],
        solution: StaticString = #function,
        line: UInt = #line,
        file: StaticString = #file,
        test: (Case, Method) -> (expect: Value, result: Value)
    ) where Value: Equatable {
        for (cidx, cs) in cases.enumerated() {
            for (midx, method) in methods.enumerated() {
                let (ans, res) = test(cs, method)
                XCTAssertEqual(ans, res, "solution <\(solution)> failed for case #\(cidx): \(cs) using method #\(midx)", file: file, line: line)
            }
        }
    }
}
