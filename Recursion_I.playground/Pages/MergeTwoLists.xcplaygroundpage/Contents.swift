// https://leetcode.com/explore/learn/card/recursion-i/253/conclusion/2382/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if let node1 = l1, let node2 = l2 {
            let next1 = l1?.next
            let next2 = l2?.next
            if node1.val < node2.val {
                node1.next = mergeTwoLists(next1, node2)
                return node1
            } else {
                node2.next = mergeTwoLists(node1, next2)
                return node2
            }
        } else {
            return l1 == nil ? l2 : l1
        }
    }
}
