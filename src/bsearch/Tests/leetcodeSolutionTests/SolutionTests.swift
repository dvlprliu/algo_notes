//
//  SolutionTests.swift
//  bsearch
//
//  Created by zhzh liu on 3/6/20.
//

@testable import leetcodeSolution
import XCTest

final class SolutionTests: XCTestCase {
    override func setUp() {}

    override class func tearDown() {}

    func testSearchInsertPosition() {
        let cases = [
            ([1, 3, 5, 6], 5, 2),
            ([1, 3, 5, 6], 2, 1),
            ([1, 3, 5, 6], 7, 4),
            ([1, 3, 5, 6], 0, 0)
        ]
        let solution = Solution()
        cases.forEach { `case` in
            let (nums, target, ans) = `case`
            let p = solution.searchInsert(nums, target)
            XCTAssertEqual(p, ans)
        }
    }

    func testMySqrt() {
        let cases = [
            (4, 2),
            (8, 2),
            (64, 8),
            (2, 1),
            (0, 0),
            (1, 1)
        ]
        let randomTest = (0..<10).map { (_) -> (Int, Int) in
            let num = Int.random(in: 123...1245)
            let ans = Int(floor(sqrtf(Float(num))))
            return (num, ans)
        }
        let solution = Solution()
        (cases + randomTest).forEach { `case` in
            let (x, n) = `case`
            XCTAssertEqual(solution.mySqrt(x), n)
        }
    }

    func testSearchRotatedSortedArray() {
        let cases = [
            ([4, 5, 6, 7, 0, 1, 2], 0, 4),
            ([4, 5, 6, 7, 0, 1, 2], 3, -1),
            ([6, 7, 0, 1, 2, 4, 5], 2, 4),
            ([6, 7, 0, 1, 2, 4, 5], 8, -1),
            ([0, 1, 2, 4, 5, 6, 7], 2, 2),
            ([6, 7, 0, 1, 2, 4, 5], 3, -1),
            ([3, 1], 1, 1)
        ]
        let solution = Solution()
        cases.forEach { `case` in
            let (nums, target, ans) = `case`
            let result = solution.search(nums, target)
            XCTAssertEqual(result, ans, "searching \(target) in \(nums) should be \(ans) but get \(result)")
        }
    }

    func testSearchII() {
        let cases = [
            ([2,5,6,0,0,1,2], 0, true),
            ([2,5,6,0,0,1,2], 3, false),
            ([1,3,5], 1, true),
            ([1,3,1,1,1], 3, true),
            ([2,5,6,0,0,1,2], 3, false)
        ]
        let solution = Solution()
        let methods: [(([Int], Int) -> Bool)] = [
            solution.searchII,
            solution.searchII_linear_filter,
            solution.searchII_linear_normal,
            solution.searchII_linear_firstIndex,
        ]
        var count = 0
        var methodNum = 0
        methods.forEach { method in
            cases.forEach { (case) in
                let (nums, target, ans) = `case`
                let result = method(nums, target)
                XCTAssertEqual(result, ans, "testing case #\(count) \(`case`) using method #\(methodNum) failed")
                count += 1
            }
            methodNum += 1
        }
    }

    func testSearchMatrix() {
        let cases = [
            ([
                [1, 3, 5, 7],
                [10, 11, 16, 20],
                [23, 30, 34, 50]
            ], 3, true),
            ([
                [1, 3, 5, 7],
                [10, 11, 16, 20],
                [23, 30, 34, 50]
            ], 8, false),
            ([
                [1], [3], [5]
            ], 5, true),
            ([
                [1], [3]
            ], 3, true),
            ([
                []
            ], 3, false)
        ]

        let solution = Solution()
        var count = 0
        cases.forEach { `case` in
            print("testing case \(count)")
            let (matrix, target, ans) = `case`
            XCTAssertEqual(solution.searchMatrix(matrix, target), ans)
            count += 1
        }
    }

    func testFindMinI() {
        let cases: [([Int], Int)] = [
            ([3,4,5,1,2], 1),
            ([4,5,6,7,0,1,2], 0)
        ]
        let solution = Solution()
        cases.forEach { (case) in
            let (nums, ans) = `case`
            XCTAssertEqual(solution.findMinI(nums), ans)
        }
    }

    func testFIndMinII() {
        let cases: [([Int], Int)] = [
            ([1,3,5], 1),
            ([2,2,2,0,1], 0),
            ([3,3,1,3], 1),
            ([1,3,3], 1)
        ]
        let solution = Solution()
        cases.forEach { (case) in
            let (nums, ans) = `case`
            XCTAssertEqual(solution.findMinII(nums), ans)
        }
    }

    func testFindPeakElement() {
        let cases = [
            ([1,2,3,1], Set([2])),
            ([1,2,1,3,5,6,4], Set([1, 5]))
        ]
        let solution = Solution()
        var count = 0
        cases.forEach { (case) in
            count += 1
            let (nums, ans) = `case`
            let result = solution.findPeakElement(nums)
            XCTAssertTrue(ans.contains(result), "#\(count): result (\(result)) is not containd correct, should be one of \(ans)")
        }
    }

    func testPeakIndexInMountainArray() {
        let cases = [
            ([0, 1, 0], 1),
            ([0, 2, 1, 0], 1)
        ]
        let solution = Solution()
        var count = 0
        cases.forEach { (case) in
            let (nums, ans) = `case`
            let result = solution.peakIndexInMountainArray(nums)
            XCTAssertEqual(result, ans, "#\(count) failed, should be \(ans), but get \(result)")
            count += 1
        }
    }

    func testTowSum() {
        let cases = [
            ([2, 7, 11, 15], 9, Set([1,2])),
            ([3, 3], 6, Set([1, 2])),
            ([12,13,23,28,43,44,59,60,61,68,70,86,88,92,124,125,136,168,173,173,180,199,212,221,227,230,277,282,306,314,316,321,325,328,336,337,363,365,368,370,370,371,375,384,387,394,400,404,414,422,422,427,430,435,457,493,506,527,531,538,541,546,568,583,585,587,650,652,677,691,730,737,740,751,755,764,778,783,785,789,794,803,809,815,847,858,863,863,874,887,896,916,920,926,927,930,933,957,981,997], 542, Set([24, 32]))
        ]
        let solution = Solution()
        let methods = [
            solution.twoSum_bsearch,
            solution.twoSum_towPointer
        ]

        for (mIdx, method) in methods.enumerated() {
            for (cIdx, `case`) in cases.enumerated() {
                let (nums, target, ans) = `case`
                let result = method(nums, target)
                XCTAssertEqual(ans, Set(result), "test #\(cIdx) using #\(mIdx) failed, should be \(ans), but get \(result)")
            }
        }
    }
}
