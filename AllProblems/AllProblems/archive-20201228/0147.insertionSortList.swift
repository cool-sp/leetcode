//
//  0147.insertionSortList.swift
//  AllProblems
//
//  Created by liuning on 2020/12/25.
//

import Foundation

func insertionSortList(_ head: ListNode?) -> ListNode? {
    let dummy = ListNode()

    var curr = head
    while curr != nil {
        let temp = curr?.next
        insertToList(dummy, curr!)
        curr = temp
    }
    return dummy.next
}

private func insertToList(_ dummy: ListNode?, _ newNode: ListNode) {
    var left = dummy
    var right = dummy?.next

    while right != nil && newNode.val > right!.val {
        left = left?.next
        right = right?.next
    }

    newNode.next = left?.next
    left?.next = newNode
}
