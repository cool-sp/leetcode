// https://leetcode.com/explore/learn/card/linked-list/214/two-pointer-technique/1212/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head?.next?.next
        var slow = head?.next
        while(fast != nil && !(fast === slow)) {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return fast != nil
    }
}
