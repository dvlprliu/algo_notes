import LRU
import XCTest

final class LRUTests: XCTestCase {
    typealias LRU = LRUCache
    func testLRU() {
        let lru = LRU(2)
        lru.put(1, 1)
        lru.put(2, 2)
        let value = lru.get(3)
        XCTAssertEqual(value, -1)
        helper()
    }

    func helper(file: StaticString = #file, line: UInt = #line) {
        let sequence = ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
        let params = [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
        let expects = [nil, nil, nil, 1, nil, -1, nil, -1, 3, 4]

        let mapping: [String: Any] = [
            "LRUCache": LRU.init,
            "put": LRU.put,
            "get": LRU.get,
        ]

        var lru: LRU?
        var result: Int?

        for (idx, opKey) in sequence.enumerated() {
            let param: [Int] = params[idx]
            let expect: Int? = expects[idx]
            let op = mapping[opKey]
            if let constructor = op as? ((Int) -> LRU) {
                lru = constructor(param[0])
            } else if let put = op as? (LRU) -> ((Int, Int) -> Void) {
                print("put(\(param[0]), \(param[1]))")
                put(lru!)(param[0], param[1])
            } else if let get_ = op as? (LRU) -> ((Int) -> Int) {
                print("get(\(param[0]))")
                result = get_(lru!)(param[0])
            }
            if let exp = expect {
                XCTAssertEqual(exp, result, file: file, line: line)
            }
        }
    }
}
