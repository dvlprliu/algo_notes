import XCTest
@testable import bsearch

final class bsearchTests: XCTestCase {
    func testBsearchIterate() {
        let nums = [8, 11, 19, 23, 27, 33, 45, 55, 67]
        let n = 27
        let ans = nums.firstIndex(of: n)
        XCTAssertEqual(BinarySearch().bsearchIterate(nums, n), ans)
    }

    func testBsearchRecursive() {
        let nums = [8, 11, 19, 23, 27, 33, 45, 55, 67]
        let n = 27
        let ans = nums.firstIndex(of: n)
        XCTAssertEqual(BinarySearch().bsearchRecursive(nums, n), ans)
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
