// https://leetcode.com/explore/learn/card/linked-list/219/classic-problems/1209/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        var preSlow: ListNode? = nil

        while(fast != nil && fast?.next != nil) {
            preSlow = slow
            fast = fast?.next?.next
            slow = slow?.next
        }

        let midLeft: ListNode?
        let midRight: ListNode?

        if fast == nil {
            midLeft = preSlow
            midRight = slow
        } else {
            midLeft = preSlow
            midRight = slow?.next
        }

        let ListA = reverse(head, midLeft)
        let ListB = midRight

        return isEqual(ListA, ListB)
    }

    func reverse(_ from: ListNode?, _ to: ListNode?) -> ListNode? {
        if (from == nil || to == nil) {
            return nil
        }

        var prev: ListNode? = nil
        var curr: ListNode? = from
        while(curr !== to) {
            var temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }

        to?.next = prev
        return to
    }

    func isEqual(_ nodeListA: ListNode?, _ nodeListB: ListNode?) -> Bool {
        var nodeA = nodeListA
        var nodeB = nodeListB

        while(nodeA != nil && nodeB != nil && nodeA?.val == nodeB?.val) {
            nodeA = nodeA?.next
            nodeB = nodeB?.next
        }

        return nodeA == nil && nodeB == nil
    }
}
