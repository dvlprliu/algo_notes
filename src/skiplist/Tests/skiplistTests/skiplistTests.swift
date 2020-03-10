import XCTest
@testable import skiplist

final class skiplistTests: XCTestCase {

    func testSkipListInsert() {
        let list = SkipList()
        list.insert(1)
        list.insert(4)
        list.insert(5)
        list.insert(7)
        list.insert(9)
        list.insert(12)
        list.insert(16)
        list.insert(18)
        XCTAssertTrue(list.find(7))
        XCTAssertFalse(list.find(53))

        list.delete(18)
        XCTAssertFalse(list.find(18))
    }
}
