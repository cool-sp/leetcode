// https://leetcode.com/explore/learn/card/linked-list/214/two-pointer-technique/1296/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let length = getLength(head)
        if (length <= 0 || n <= 0) {
            return nil
        }

        let steps = length - n
        let prevNode = move(head, steps - 1)
        if prevNode == nil {
            return head?.next
        } else {
            prevNode?.next = prevNode?.next?.next
            return head
        }
    }

    func getLength(_ node: ListNode?) -> Int {
        var len = 0
        var node = node
        while(node != nil) {
            node = node?.next
            len = len + 1
        }
        return len
    }

    func move(_ node: ListNode?, _ steps: Int) -> ListNode? {
        var steps = steps
        var node = node

        if steps < 0 {
            return nil
        }
        while(steps > 0) {
            node = node?.next
            steps = steps - 1
        }
        return node
    }
}
