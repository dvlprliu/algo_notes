import XCTest
@testable import bsearch

final class bsearchTests: XCTestCase {
    func testBsearchIterate() {
        let cases = [
            ([8, 11, 19, 23, 27, 33, 45, 55, 67], 27, 4),
            ([8, 11, 19, 23, 27, 33, 45, 55, 67], 76, -1)
        ]
        cases.forEach { (case) in
            let (nums, target, ans) = `case`
            XCTAssertEqual(BinarySearch().bsearchIterate(nums, target), ans)
        }
    }

    func testBsearchRecursive() {
        let cases = [
            ([8, 11, 19, 23, 27, 33, 45, 55, 67], 27, 4),
            ([8, 11, 19, 23, 27, 33, 45, 55, 67], 76, -1)
        ]
        cases.forEach { (case) in
            let (nums, target, ans) = `case`
            XCTAssertEqual(BinarySearch().bsearchRecursive(nums, target), ans)
        }
    }

    func testBsearchVariations_findFirstEqualTo() {
        let nums = [8, 11, 19, 23, 27, 33, 45, 45, 45, 45, 55, 67]
        let n = 45
        let ans = nums.firstIndex(of: n)
        XCTAssertEqual(BinarySearch().bsearch(from: nums, firstEqualTo: n), ans)
    }

    func testBsearchVariations_findLastEqualTo() {
        let nums = [8, 11, 19, 23, 27, 33, 45, 45, 45, 45, 55, 67]
        let n = 45
        let ans = nums.lastIndex(of: n)
        XCTAssertEqual(BinarySearch().bsearch(from: nums, lastEqualTo: n), ans)
    }

    func testBsearchVariations_findFirstGreaterThanOrEqualTo() {
        let nums = [8, 11, 19, 23, 27, 33, 45, 45, 45, 45, 55, 67]
        let n = 25
        let ans = nums.firstIndex { $0 > n }
        XCTAssertEqual(BinarySearch().bsearch(from: nums, firstGreaterThanOrEqualTo: n), ans)
    }

    func testBsearchVariations_findLastLessThanOrEqualTo() {
        let nums = [8, 11, 19, 23, 27, 33, 45, 45, 45, 45, 55, 67]
        let n = 25
        let ans = nums.lastIndex { $0 < n }
        XCTAssertEqual(BinarySearch().bsearch(from: nums, lastLessThanOrEqualTo: n), ans)
    }

    static var allTests = [
        ("testBsearchIterate", testBsearchIterate),
    ]
}
