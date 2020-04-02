//
//  LeetcodeTests.swift
//  binary-treeTests
//
//  Created by zhzh liu on 4/1/20.
//

import XCTest
@testable import binary_tree
@testable import leetcode

class LeetcodeTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testSameTree() {
        let solution = Solution()
        let cases: [(([Int?], [Int?]), Bool)] = [
            (([1,nil,2], [1, nil, 2]), true),
            (([1,2,3], [1,2,3]), true),
            (([1,2], [1, nil, 2]), false),
            (([1,2,1], [1,1,2]), false),
            (([], []), true)
        ]
        let methods = [
            solution.sameTree
        ]

        testHelper(cases: cases, methods: methods) { (test, method) -> (Bool, Bool) in
            let ((a, b), ans) = test
            let p = TreeNode.tree(from: a)
            let q = TreeNode.tree(from: b)
            let result = method(p, q)
            return (ans, result)
        }
    }

    func testIsSymmetric() {
        let solution = Solution()
        let cases: [([Int?], Bool)] = [
            ([1,2,2,3,4,4,3], true),
            ([1,2,2,nil,3,nil,3], false)
        ]
        let methods = [
            solution.isSymmetric_recursive,
            solution.isSymmetric_iterate
        ]
        testHelper(cases: cases, methods: methods) { (test, method) -> (Bool, Bool) in
            let (c, expect) = test
            let tree = TreeNode.tree(from: c)
            return (expect, method(tree))
        }
    }

    func testMaxDepth() {
        let solution = Solution()
        let cases = [
            ([3,9,20,nil,nil,15,7], 3),
            ([1,2,3,4,5], 3)
        ]
        let methods = [
            solution.maxDepth_recursive,
            solution.maxDepth_iterate
        ]
        testHelper(cases: cases, methods: methods) { (test, method) -> (Int, Int) in
            let (c, expect) = test
            let tree = TreeNode.tree(from: c)
            let result = method(tree)
            return (expect, result)
        }
    }

    func testHelper<Case, Method, Value>(cases: [Case], methods: [Method], solution: StaticString = #function, line: UInt = #line, file: StaticString = #file, test: ((Case, Method) -> (Value, Value))) where Value: Equatable {
        for (cidx, cs) in cases.enumerated() {
            for (midx, method) in methods.enumerated() {
                let (ans, res) = test(cs, method)
                XCTAssertEqual(ans, res, "solution <\(solution)> failed for case #\(cidx): \(cs) using method #\(midx)", file: file, line: line)
            }
        }
    }
}
