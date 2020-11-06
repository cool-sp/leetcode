// https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/536/

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }

        return check(root?.left, root?.right)
    }

    func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }

        if left?.val != right?.val {
            return false
        }

        if !check(left?.left, right?.right) {
            return false
        }

        return check(left?.right, right?.left)
    }
}
