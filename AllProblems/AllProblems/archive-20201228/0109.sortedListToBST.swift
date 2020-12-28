//
//  0109.sortedListToBST.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    guard head != nil else { return nil }

    var len = 0
    var next = head
    while let temp = next {
        next = temp.next
        len += 1
    }

    var head = head
    return buildTree(&head, 0, len-1)
}

private func buildTree(_ head: inout ListNode?, _ from: Int, _ to: Int) -> TreeNode? {
    if from > to { return nil }

    let mid = from + (to-from)/2
    let root = TreeNode(0)
    root.left = buildTree(&head, from, mid-1)
    root.val = head!.val
    head = head?.next
    root.right = buildTree(&head, mid+1, to)

    return root
}

//func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//    return toBST(head, nil)
//}
//
//private func toBST(_ from: ListNode?, _ to: ListNode?) -> TreeNode? {
//    guard from !== nil else { return nil }
//    guard from !== to else { return nil }
//
//    var slow = from
//    var fast = from
//
//    while fast !== to && fast?.next !== to {
//        slow = slow?.next
//        fast = fast?.next?.next
//    }
//
//    let root = TreeNode(slow!.val)
//    root.left = toBST(from, slow)
//    root.right = toBST(slow?.next, to)
//    return root
//}
