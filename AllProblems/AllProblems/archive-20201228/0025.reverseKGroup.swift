//
//  0025.reverseKGroup.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if k <= 1 { return head }

    var root:ListNode? = nil
    var curr = head
    var prevTail: ListNode? = nil
    while canMoveK(curr, k) {
        let (newHead, newTail, nextNode) = reverse(curr, k)
        prevTail?.next = newHead
        prevTail = newTail
        curr = nextNode
        if root == nil { root = newHead }
    }

    prevTail?.next = curr
    return root
}

private func reverse(_ head: ListNode?, _ k: Int) -> (ListNode?, ListNode?, ListNode?) {
    // p -> q -> z
    // p <- q <- z
    var p = head
    var q = head?.next
    var z = head?.next?.next

    var steps = k - 1
    while steps > 0 {
        q?.next = p
        p = q
        q = z
        z = z?.next
        steps -= 1
    }

    head?.next = nil
    let newTail = head
    let newHead = p
    let nextNode = q

    return (newHead, newTail, nextNode)
}

private func canMoveK(_ head: ListNode?, _ k: Int) -> Bool {
    var steps = k - 1
    var head = head

    while head?.next != nil && steps > 0 {
        head = head?.next
        steps -= 1
    }

    return steps == 0
}
