// https://leetcode.com/explore/learn/card/linked-list/213/conclusion/1227/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }

        var node1 = l1
        var node2 = l2
        var head = ListNode(0)
        var result: ListNode? = head
        while(node1 != nil && node2 != nil) {
            if node1!.val < node2!.val {
                result?.next = node1
                node1 = node1?.next
            } else {
                result?.next = node2
                node2 = node2?.next
            }
            result = result?.next
        }

        if node1 != nil {
            result?.next = node1
        } else {
            result?.next = node2
        }

        return head.next
    }
}
