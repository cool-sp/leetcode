// https://leetcode.com/explore/learn/card/linked-list/214/two-pointer-technique/1214/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head?.next?.next
        var slow = head?.next

        while(fast != nil && fast !== slow) {
            fast = fast?.next?.next
            slow = slow?.next
        }

        if fast == nil {
            return nil
        }

        fast = head
        while(fast !== slow) {
            fast = fast?.next
            slow = slow?.next
        }

        return fast
    }
}
