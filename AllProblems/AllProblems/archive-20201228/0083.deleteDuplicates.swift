//
//  0083.deleteDuplicates.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func deleteDuplicates83(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }

    var curr = head
    var next = head?.next

    while next != nil {
        if next?.val == curr?.val {
            next = next?.next
        } else {
            curr?.next = next
            curr = next
            next = next?.next
        }
    }
    curr?.next = next // don't forget the tailing part

    return head
}
