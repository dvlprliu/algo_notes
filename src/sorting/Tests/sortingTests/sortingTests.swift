import Foundation
@testable import sorting
import XCTest

final class sortingTests: XCTestCase {
    func testBubbleSort() {
        sortingTest(Sort().bubbleSort)
    }

    func testInsertionSort() {
        sortingTest(Sort().insertionSort)
    }

    func testSelectionSort() {
        sortingTest(Sort().selectionSort)
    }

    func testMergeSort() {
        sortingTest(Sort().mergeSort)
    }

    func testQuickSort() {
        sortingTest(Sort().quickSort)
    }

    func sortingTest(_ sortMethod: ([Int]) -> [Int], line: UInt = #line) {
        let tests = [
            [],
            [0],
            [0, 0],
            [0, 0, 0],
            [0, 1],
            [1, 0],
            [0, 1, 2],
            [0, 2, 1],
            [1, 0, 2],
            [1, 2, 0],
            [2, 0, 1],
            [2, 1, 0],
            [0, 1, 1],
            [1, 0, 1],
            [1, 1, 0],
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            [10, 9, 8, 7, 6, 5, 4, 3, 2, 1],
            [42, 9, 17, 54, 602, -3, 54, 999, -11],
            [-11, -3, 9, 17, 42, 54, 54, 602, 999],
        ]
        var randomTests = [[Int]]()
        for _ in 0...9 {
            var a = [Int]()
            for _ in 0...Int.random(in: 1...100) {
                a.append(Int.random(in: 50000...100000))
            }
            randomTests.append(a)
        }

        var ntests = 0
        var nok = 0
        let toString: ([Int]) -> String = { nums in
            nums.map(String.init).joined(separator: ", ")
        }
        let allCases = tests + randomTests
        allCases.enumerated().forEach { pair in
            let (index, array) = pair
            let sorted = sortMethod(array)
            if sorted == array.sorted() {
                nok += 1
            } else {
                print("fail test \(index): [\(toString(array))] -> [\(toString(sorted))]")
            }
            ntests += 1
        }
        XCTAssertEqual(nok, allCases.count, "passed \(nok) of \(ntests)", line: line)
    }

    static var allTests = [
        ("testBubbleSort", testBubbleSort),
        ("testInsersionSort", testInsertionSort),
        ("testSelectionSort", testSelectionSort),
        ("testMergeSort", testMergeSort),
        ("testQuickSort", testQuickSort),
    ]
}
