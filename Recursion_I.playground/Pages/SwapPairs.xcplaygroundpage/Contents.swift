// https://leetcode.com/explore/learn/card/recursion-i/250/principle-of-recursion/1681/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }

        let node1 = head
        let node2 = head.next
        let node3 = head.next?.next

        if let node2 = node2 {
            node2.next = node1
            node1.next = swapPairs(node3)
            return node2
        } else {
            return node1
        }
    }
}
