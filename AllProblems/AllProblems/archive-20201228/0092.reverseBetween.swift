//
//  0092.reverseBetween.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    let dummy = ListNode()
    dummy.next = head

    var curr: ListNode? = dummy
    var prev: ListNode? = dummy
    var i = 0
    while i < m {
        prev = curr
        curr = curr?.next
        i += 1
    }

    let tail: ListNode? = curr
    var steps = n - m
    var next = curr?.next
    while steps > 0 {
        let temp = next
        next = next?.next
        temp?.next = curr
        curr = temp

        steps -= 1
    }

    prev?.next = curr
    tail?.next = next
    return dummy.next
}
