// https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/931/

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

class Queue<T> {
    var container = [T]()

    func append(_ val: T?) {
        if let val = val {
            container.append(val)
        }
    }

    func remove() -> T? {
        if container.count > 0 {
            let result = container[0]
            container.removeFirst()
            return result
        }
        return nil
    }

    func size() -> Int {
        return container.count
    }

    func isEmpty() -> Bool {
        return size() <= 0
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }

        var result = [[Int]]()
        let queue = Queue<TreeNode>()
        queue.append(root)

        while(!queue.isEmpty()) {
            var layerResult = [Int]()
            var layerCount = queue.size()

            while(layerCount > 0) {
                var node = queue.remove()
                layerCount = layerCount - 1
                layerResult.append(node!.val)
                queue.append(node?.left)
                queue.append(node?.right)
            }

            result.append(layerResult)
        }

        return result
    }
}
