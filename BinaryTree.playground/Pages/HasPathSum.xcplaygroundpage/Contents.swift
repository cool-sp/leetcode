// https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/537/

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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }

        if root?.left == nil && root?.right == nil {
            return root!.val == sum
        } else {
            return hasPathSum(root?.left, sum - root!.val)
                || hasPathSum(root?.right, sum - root!.val)
        }
    }
}
