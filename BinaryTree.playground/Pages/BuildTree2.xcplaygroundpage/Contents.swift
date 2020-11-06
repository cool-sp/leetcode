// https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/943/

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
    var preorder = [Int]()
    var inorder = [Int]()
    var inorderMap = [Int: Int]()

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count <= 0 || inorder.count <= 0 || preorder.count != inorder.count {
            return nil
        }

        for (index, val) in inorder.enumerated() {
            inorderMap[val] = index
        }

        self.preorder = preorder
        self.inorder = inorder

        return buildTree(0, preorder.count-1, 0, inorder.count-1)
    }

    func buildTree(_ preFrom: Int, _ preTo: Int, _ inFrom: Int, _ inTo: Int) -> TreeNode? {
        let rootVal = preorder[preFrom]

        let indexRoot = inorderMap[rootVal]!
        let leftCount = indexRoot - inFrom
        let rightCount = inTo - indexRoot

        let root = TreeNode(rootVal)
        let left: TreeNode?
        let right: TreeNode?
        if leftCount > 0 {
            left = buildTree(preFrom+1, preFrom+leftCount, inFrom, inFrom+leftCount-1)
        } else {
            left = nil
        }
        if rightCount > 0 {
            right = buildTree(preFrom+leftCount+1, preFrom+leftCount+rightCount, inFrom+leftCount+1, inTo)
        } else {
            right = nil
        }
        root.left = left
        root.right = right
        return root
    }
}
