// https://leetcode.com/explore/learn/card/recursion-i/251/scenario-i-recurrence-relation/2378/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        return reverse(head, nil)
    }

    func reverse(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        if let head = head {
            let temp = head.next
            head.next = tail
            return reverse(temp, head)
        }
        return tail
    }
}
