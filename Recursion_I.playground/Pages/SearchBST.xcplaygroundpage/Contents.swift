// https://leetcode.com/explore/learn/card/recursion-i/251/scenario-i-recurrence-relation/3233/

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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val < val {
            return searchBST(root.right, val)
        } else if root.val > val {
            return searchBST(root.left, val)
        } else {
            return root
        }

    }
}
