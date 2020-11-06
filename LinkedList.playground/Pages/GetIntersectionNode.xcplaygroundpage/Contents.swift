// https://leetcode.com/explore/learn/card/linked-list/214/two-pointer-technique/1215/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        let (lenA, tailA) = getLengthAndTail(headA)
        let (lenB, tailB) = getLengthAndTail(headB)

        if tailA == nil || tailB == nil || tailA !== tailB {
            return nil
        }

        var nodeA = headA
        var nodeB = headB
        if lenA > lenB {
            nodeA = move(headA, lenA - lenB)
        } else {
            nodeB = move(headB, lenB - lenA)
        }

        while(nodeA !== nodeB) {
            nodeA = nodeA?.next
            nodeB = nodeB?.next
        }

        return nodeA
    }

    func getLengthAndTail(_ node: ListNode?) -> (Int, ListNode?) {
        var len = 0
        var node = node
        var tail: ListNode? = node
        while(node != nil) {
            tail = node
            node = node?.next
            len = len + 1
        }
        return (len, tail)
    }

    func move(_ node: ListNode?, _ steps: Int) -> ListNode? {
        var steps = steps
        var moveTo = node
        while(steps > 0) {
            moveTo = moveTo?.next
            steps = steps - 1
        }
        return moveTo
    }
}
