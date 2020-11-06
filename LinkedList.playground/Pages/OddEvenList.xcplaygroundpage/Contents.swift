// https://leetcode.com/explore/learn/card/linked-list/219/classic-problems/1208/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddListTail: ListNode? = nil
        var evenListTail: ListNode? = nil
        let evenListHead: ListNode? = head?.next

        var count = 1
        var node = head
        while(node != nil) {
            let next = node?.next
            if count % 2 != 0 {
                oddListTail = appendNode(oddListTail, node)
            } else {
                evenListTail = appendNode(evenListTail, node)
            }
            count = count + 1
            node = next
        }

        appendNode(oddListTail, evenListHead)
        evenListTail?.next = nil

        return head
    }

    func appendNode(_ node: ListNode?, _ append: ListNode?) -> ListNode? {
        if let node = node {
            node.next = append
        }
        return append
    }
}
