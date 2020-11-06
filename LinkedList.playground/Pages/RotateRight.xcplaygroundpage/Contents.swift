// https://leetcode.com/explore/learn/card/linked-list/213/conclusion/1295/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k < 0 {
            return nil
        }

        var len = 1
        var tail: ListNode? = head
        while(tail?.next != nil) {
            len = len + 1
            tail = tail?.next
        }

        tail?.next = head

        var prevHead = tail
        var steps = (len - k % len) % len
        while(steps > 0) {
            prevHead = prevHead?.next
            steps = steps - 1
        }

        var newHead = prevHead?.next
        prevHead?.next = nil
        return newHead
    }
}
