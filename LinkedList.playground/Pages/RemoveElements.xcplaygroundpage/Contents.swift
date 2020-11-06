// https://leetcode.com/explore/learn/card/linked-list/219/classic-problems/1207/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var prev: ListNode? = nil
        var head = head
        var curr = head

        while(curr != nil) {
            if curr?.val == val {
                if prev == nil {
                    head = curr?.next
                    curr = curr?.next
                } else {
                    prev?.next = curr?.next
                    curr = curr?.next
                }
            } else {
                prev = curr
                curr = curr?.next
            }
        }

        return head
    }
}
