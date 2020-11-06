// https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/932/

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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }

        if root === p || root === q {
            return root
        }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)

        if left == nil && right == nil {
            return nil
        } else if left != nil && right != nil {
            return root
        } else {
            return left == nil ? right : left
        }
    }
}

//class Solution {
//    var aPath = [TreeNode]()
//    var bPath = [TreeNode]()
//
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        if root == nil || p == nil || q == nil {
//            return nil
//        }
//
//        let path = [root!]
//        return visit(root, p, q, path)
//    }
//
//    func visit(_ node: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ path: [TreeNode]) -> TreeNode? {
//        if node === p {
//            aPath = path
//        } else if node === q {
//            bPath = path
//        }
//
//        if node === p || node === q {
//            if let common = trySolve() {
//                return common
//            }
//        }
//
//        if let left = node?.left {
//            let morePath = path + [left]
//            if let common = visit(left, p, q, morePath) {
//                return common
//            }
//        }
//        if let right = node?.right {
//            let morePath = path + [right]
//            if let common = visit(right, p, q, morePath) {
//                return common
//            }
//        }
//
//        return nil
//    }
//
//    func trySolve() -> TreeNode? {
//        if aPath.count <= 0 || bPath.count <= 0 {
//            return nil
//        }
//
//        var index = 0
//        while(index < aPath.count && index < bPath.count && aPath[index] === bPath[index]) {
//            index = index + 1
//        }
//        return aPath[index-1]
//    }
//}
