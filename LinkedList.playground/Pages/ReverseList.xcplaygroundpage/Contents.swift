// https://leetcode.com/explore/learn/card/linked-list/219/classic-problems/1205/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prevNode: ListNode? = nil
        var currNode: ListNode? = head

        while(currNode != nil) {
            var newPrev = currNode
            var newCurr = currNode?.next

            currNode?.next = prevNode

            prevNode = newPrev
            currNode = newCurr
        }

        return prevNode
    }
}
