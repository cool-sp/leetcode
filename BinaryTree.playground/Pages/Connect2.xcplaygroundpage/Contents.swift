// https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/1016/

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution {
    func connect(_ root: Node?) -> Node? {
        var recordOfNext = [Int:Node]()
        connect(root, 0, &recordOfNext)

        return root
    }


    func connect(_ node: Node?, _ layer: Int, _ recordOfNext: inout [Int:Node]) {
        if node == nil {
            return
        }
        node?.next = recordOfNext[layer]
        recordOfNext[layer] = node!

        connect(node?.right, layer+1, &recordOfNext)
        connect(node?.left, layer+1, &recordOfNext)
    }
}
