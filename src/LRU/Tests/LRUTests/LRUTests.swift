import XCTest
@testable import LRU

final class LRUTests: XCTestCase {

    func testLRU() {
        let lru = LRU(capacity: 10)
        lru.get(key: 3)
//        lru.put(key: 3)
    }

    func helper() {
        let sequence = ["LRUCache","put","put","get","put","get","put","get","get","get"]
        let params = [[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
        let expects = [nil,nil,nil,1,nil,-1,nil,-1,3,4]

        let a = LRU.put
        let mapping: [String: Any] = [
            "LRUCache": LRU.init,
            "put" : LRU.put,
            "get" : LRU.get,
        ]
    }

}
