//
//  0082.deleteDuplicates.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }

    let root = ListNode()
    root.next = head

    var prev: ListNode? = root
    var curr: ListNode? = root.next
    var deleteSelf = false

    while curr != nil {
        if curr?.val == curr?.next?.val {
            curr = curr?.next
            deleteSelf = true
        } else {
            if deleteSelf {
                prev?.next = curr?.next
                curr = curr?.next
                deleteSelf = false
            } else {
                prev = curr
                curr = curr?.next
            }
        }
    }

    return root.next
}
