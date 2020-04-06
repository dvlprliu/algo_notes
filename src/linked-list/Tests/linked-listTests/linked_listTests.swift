import XCTest
@testable import linked_list

final class linked_listTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(linked_list().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
