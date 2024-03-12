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

        testHelper(cases: cases, methods: methods) { cases, method -> Bool in
            let p = TreeNode.tree(from: cases.0)
            let q = TreeNode.tree(from: cases.1)
            let result = method(p, q)
            return result
        }
    }

    func testLevelOrderTraverselArray() {
        let solution = Solution()
        let cases = [
            ([3, 9, 20, nil, nil, 15, 7], [[3], [9, 20], [15, 7]]),
            ([1], [[1]]),
            ([], []),
            ([3, 9, 20, 5, 678, 15, 7], [[3], [9, 20], [5, 678, 15, 7]]),
        ].map(Case<[Int?], [[Int]]>.init)

        let methods = [
            solution.levelOrderTraversel_,
        ]

        testHelper(cases: cases, methods: methods) { treeData, method in
            method(makeTree(treeData))
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

        testHelper(cases: cases, methods: methods) { cs, method -> Bool in
            let tree = TreeNode.tree(from: cs)
            let result = method(tree)
            return result
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

        testHelper(cases: cases, methods: methods) { input, method -> Int in
            method(makeTree(input))
        }
    }

    func testHelper<Input, Output, Method>(
        cases: [Case<Input, Output>],
        methods: [Method],
        solution: StaticString = #function,
        line: UInt = #line,
        file: StaticString = #file,
        test: (Input, Method) -> Output
    ) where Output: Equatable {
        for (cidx, cs) in cases.enumerated() {
            for (midx, method) in methods.enumerated() {
                let res = test(cs.value, method)
                XCTAssertEqual(cs.expect, res, "solution <\(solution)> failed for case #\(cidx): \(cs) using method #\(midx)", file: file, line: line)
            }
        }
    }

    private func makeTree(_ values: [Int?]) -> binary_tree.TreeNode<Int>? {
        TreeNode.tree(from: values)
    }
}
