// https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/942/

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

//class Solution {
//    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
//        if inorder.count <= 0 || postorder.count <= 0 || inorder.count != postorder.count {
//            return nil
//        }
//
//        var rootVal = postorder[postorder.count-1]
//        let (leftTreeInorder, rightTreeInorder) = divideInorder(rootVal, inorder)
//        let leftCount = leftTreeInorder.count
//        let rightCount = rightTreeInorder.count
//        let (leftTreePostorder, rightTreePostorder) = dividePostorder(postorder, leftCount, rightCount)
//
//        let root = TreeNode(rootVal)
//        if leftCount <= 0 {
//            root.left = nil
//        } else {
//            root.left = buildTree(leftTreeInorder, leftTreePostorder)
//        }
//        if rightCount <= 0 {
//            root.right = nil
//        } else {
//            root.right = buildTree(rightTreeInorder, rightTreePostorder)
//        }
//        return root
//    }
//
//    func divideInorder(_ rootVal: Int, _ inorder: [Int]) -> ([Int], [Int]) {
//        let found = inorder.firstIndex(of: rootVal)!
//        let leftTree: [Int]
//        let rightTree: [Int]
//
//        let leftTreeCount = found
//        let rightTreeCount = inorder.count - 1 - found
//
//        if leftTreeCount <= 0 {
//            leftTree = []
//        } else {
//            leftTree = Array(inorder[0..<found])
//        }
//
//        if rightTreeCount <= 0 {
//            rightTree = []
//        } else {
//            rightTree = Array(inorder[(found+1)..<inorder.count])
//        }
//
//        return (leftTree, rightTree)
//    }
//
//    func dividePostorder(_ postorder: [Int], _ leftCount: Int, _ rightCount: Int) -> ([Int], [Int]) {
//        let leftTree: [Int]
//        let rightTree: [Int]
//
//        if leftCount <= 0 {
//            leftTree = []
//        } else {
//            leftTree = Array(postorder[0..<leftCount])
//        }
//
//        if rightCount <= 0 {
//            rightTree = []
//        } else {
//            rightTree = Array(postorder[leftCount..<(postorder.count-1)])
//        }
//
//        return (leftTree, rightTree)
//    }
//}

class Solution {
    var map = [Int:Int]()
    var postorder = [Int]()
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        self.postorder = postorder
        for (index,value) in inorder.enumerated() {
            map[value] = index
        }
        return rescur(post_root: postorder.count - 1, in_left: 0, in_right: inorder.count - 1)
    }
    func rescur(post_root:Int, in_left:Int, in_right:Int) -> TreeNode? {
        if in_left > in_right {
            return nil
        }
        let pivot = postorder[post_root]
        let root = TreeNode(pivot)
        let root_in_index = map[pivot]!
        /*
         右子树长度：in_right - root_in_index
         后序遍历根节点位置：post_root
         左子树根节点位置：post_root - (in_right - root_in_index) - 1
         */
        root.left = rescur(post_root:post_root - (in_right - root_in_index) - 1, in_left: in_left, in_right: root_in_index - 1)
        root.right = rescur(post_root: post_root - 1 , in_left: root_in_index + 1, in_right: in_right)

        return root
    }
}
