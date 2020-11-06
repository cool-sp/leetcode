// https://leetcode.com/explore/learn/card/linked-list/213/conclusion/1225/

public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

class Solution {
    func flatten(_ head: Node?) -> Node? {
        flat(head)
        return head
    }

    func flat(_ head: Node?) -> Node? {
        var node = head
        var prevNode: Node? = nil
        while(node != nil) {
            if let child = node?.child {
                node?.child = nil
                let childTail = flat(child)
                childTail?.next = node?.next
                node?.next?.prev = childTail
                node?.next = child
                child.prev = node
                prevNode = childTail
                node = childTail?.next
            } else {
                prevNode = node
                node = node?.next
            }
        }
        return prevNode
    }
}
