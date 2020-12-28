//
//  0086.partition.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let small = ListNode()
    let large = ListNode()
    var smallNode: ListNode? = small
    var largeNode: ListNode? = large

    var head = head
    while(head != nil) {
        if head!.val < x {
            smallNode?.next = head
            smallNode = head
        } else {
            largeNode?.next = head
            largeNode = head
        }
        head = head?.next
    }

    smallNode?.next = large.next
    largeNode?.next = nil

    return small.next
}
