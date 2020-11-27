//
//  0148.sortList.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

func sortList(_ head: ListNode?) -> ListNode? {
    let length = getListLength(head)
    if length <= 0 { return nil }

    let dummy = ListNode()
    dummy.next = head

    var subLength = 1
    while(subLength < length) {
        var unmerged = dummy.next
        var mergedTail: ListNode? = dummy
        var mergedHead: ListNode? = nil

        while(unmerged != nil) {
            // find the first part
            let node1 = unmerged
            var curr = node1
            var prev: ListNode? = nil
            (prev, curr) = moveSteps(node1, subLength)
            prev?.next = nil

            // find the second part
            let node2 = curr
            (prev, curr) = moveSteps(node2, subLength)
            prev?.next = nil

            // save the unmerged node, for the next round
            unmerged = curr

            let mergedSubList = mergeList(node1, node2)
            if mergedHead == nil { mergedHead = mergedSubList}
            mergedTail?.next = mergedSubList
            mergedTail = getListTail(mergedSubList)
        }

        dummy.next = mergedHead
        subLength = subLength * 2
    }

    return dummy.next
}

private func getListLength(_ list: ListNode?) -> Int {
    var list = list
    var len = 0
    while(list != nil) {
        list = list?.next
        len += 1
    }
    return len
}

private func moveSteps(_ list: ListNode?, _ k: Int) -> (ListNode?, ListNode?) {
    var curr = list
    var prev: ListNode? = nil
    var count = 0
    while(count < k) {
        prev = curr
        curr = curr?.next
        count += 1
    }

    return (prev, curr)
}

private func getListTail(_ list: ListNode?) -> ListNode? {
    var node = list
    while(node?.next != nil) {
        node = node?.next
    }
    return node
}

private func mergeList(_ listA: ListNode?, _ listB: ListNode?) -> ListNode? {
    if listA == nil { return listB }
    if listB == nil { return listA }

    let root = ListNode()
    var curr: ListNode? = root
    var nodeA = listA
    var nodeB = listB
    while(nodeA != nil && nodeB != nil) {
        if nodeA!.val < nodeB!.val {
            curr?.next = nodeA
            nodeA = nodeA?.next
            curr = curr?.next
        } else {
            curr?.next = nodeB
            nodeB = nodeB?.next
            curr = curr?.next
        }
    }

    if nodeA != nil { curr?.next = nodeA }
    else { curr?.next = nodeB }
    return root.next
}
