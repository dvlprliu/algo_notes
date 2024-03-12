import binary_tree
import Foundation

extension Solution {
  func levelOrderTraversel_(_ root: TreeNode?) -> [[Int]] {
    root?.levelOrderTraversel_array() ?? []
  }
}
