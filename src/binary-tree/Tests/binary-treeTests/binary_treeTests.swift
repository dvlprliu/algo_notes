@testable import binary_tree
import XCTest

final class binary_treeTests: XCTestCase {
    func testLevelOrderTraversel() {
        let tree = TreeNode<Int>.tree(from: [1, 2, 2, nil, 3, nil, 3])
        let values = tree?.levelOrderTraversel() ?? []
        XCTAssertEqual([1, 2, 2, 3, 3], values.compactMap { $0 })
    }

    func testTreeMap() {
        let array = [1, 2, 3, 4, 5, 6]
        let tree = array.tree()
        let newTree = tree?.map { "\($0)" }?.levelOrderTraversel()
        XCTAssertEqual(array.map { "\($0)" }, newTree ?? [])
    }
}
