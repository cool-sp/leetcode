// https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/994/

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
        connect(root, nil)
        return root
    }

    func connect(_ node: Node?, _ neighbor: Node?) {
        if let node = node {
            node.next = neighbor
            connect(node.left, node.right)
            connect(node.right, neighbor?.left)
        }
    }
}
