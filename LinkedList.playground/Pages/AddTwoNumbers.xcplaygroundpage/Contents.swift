// https://leetcode.com/explore/learn/card/linked-list/213/conclusion/1228/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var sum = 0
        var num = 0
        var carryover = 0
        var head = ListNode(0)
        var result: ListNode? = head

        while(node1 != nil && node2 != nil) {
            sum = node1!.val + node2!.val + carryover
            num = sum % 10
            carryover = sum / 10

            result?.next = ListNode(num)
            result = result?.next

            node1 = node1?.next
            node2 = node2?.next
        }

        var remaining = node1 == nil ? node2 : node1
        while(remaining != nil) {
            sum = remaining!.val + carryover
            num = sum % 10
            carryover = sum / 10

            result?.next = ListNode(num)
            result = result?.next

            remaining = remaining?.next
        }

        if carryover != 0 {
            result?.next = ListNode(carryover)
        }

        return head.next
    }
}
