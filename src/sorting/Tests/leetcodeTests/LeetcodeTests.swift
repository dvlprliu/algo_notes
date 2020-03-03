import XCTest
import Foundation
@testable import leetcode

final class sortingTests: XCTestCase {
    func testMergeIntervals() {

        let cases = [
            // [[case], [answer]]
            [ [[1, 4], [0, 0]], [[0,0], [1, 4]] ],
            [ [[1, 4], [0, 4]], [[0,4]] ],
            [ [[2,3],[4,5],[6,7],[8,9],[1,10]], [[1,10]] ]
        ]
        let solution = Solution()
        cases.forEach { (pair) in
            let test = pair[0]
            let ans = pair[1]
            let result = solution.merge(test)
            XCTAssertEqual(result, ans)
        }
    }
}
