// https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/535/

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
    func max(_ a: Int, _ b: Int) -> Int {
        return a > b ? a : b
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let leftMax = maxDepth(root?.left)
        let rightMax = maxDepth(root?.right)
        return max(leftMax, rightMax) + 1
    }
}
