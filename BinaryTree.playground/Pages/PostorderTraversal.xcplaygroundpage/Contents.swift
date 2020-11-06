// https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/930/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        visit(root, &result)
        return result
    }

    func visit(_ node: TreeNode?, _ result: inout [Int]) {
        if let node = node {
            visit(node.left, &result)
            visit(node.right, &result)
            result.append(node.val)
        }
    }
}
