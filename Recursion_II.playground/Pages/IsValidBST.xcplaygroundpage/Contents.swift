// https://leetcode.com/explore/learn/card/recursion-ii/470/divide-and-conquer/2874/

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, Int.min, Int.max)
    }

    func isValidBST(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let node = node else { return true }
        if node.val <= min || node.val >= max { return false}

        let leftResult = isValidBST(node.left, min, node.val)
        let rightResult = isValidBST(node.right, node.val, max)
        return leftResult && rightResult
    }
}
