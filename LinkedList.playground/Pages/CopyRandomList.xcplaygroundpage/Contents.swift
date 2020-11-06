// https://leetcode.com/explore/learn/card/linked-list/213/conclusion/1229/

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension Node: Hashable {
    public static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var objMap: [Node: Node] = [:]

        var node = head
        var newHead = Node(0)
        var copiedNode: Node? = newHead

        while(node != nil) {
            let copied = Node(node!.val)
            copiedNode?.next = copied
            objMap[node!] = copied

            node = node?.next
            copiedNode = copiedNode?.next
        }

        node = head
        copiedNode = newHead.next

        while(node != nil) {
            if let random = node?.random {
                copiedNode?.random = objMap[random]
            }

            node = node?.next
            copiedNode = copiedNode?.next
        }

        return newHead.next
    }
}
