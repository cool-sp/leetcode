// https://leetcode.com/explore/learn/card/recursion-i/253/conclusion/2384/

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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else { return [] }
        return generate(1, n+1)
    }

    func generate(_ from: Int, _ to: Int) -> [TreeNode?] {
        if from >= to { return [nil] }
        var result = [TreeNode?]()

        for idx in from..<to {
            let leftTreeCollection = generate(from, idx)
            let rightTreeCollection = generate(idx+1, to)
            for leftTree in leftTreeCollection {
                for rightTree in rightTreeCollection {
                    let root = TreeNode(idx)
                    result.append(root)
                    root.left = leftTree
                    root.right = rightTree
                }
            }
        }

        return result
    }
}
