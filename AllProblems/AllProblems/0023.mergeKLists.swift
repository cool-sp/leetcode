//
//  0023.mergeKLists.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//    var lists = lists
//
//    var result: ListNode? = ListNode()
//    let resultHead = result
//
//    while(true) {
//        var minIndex = -1
//        var minVal = Int.max
//
//        lists = lists.filter {$0 != nil }
//        for (idx, node) in lists.enumerated() {
//            if let node = node {
//                if node.val < minVal {
//                    minIndex = idx
//                    minVal = node.val
//                }
//            }
//        }
//
//        if minIndex < 0 {
//            break
//        } else {
//            lists[minIndex] = lists[minIndex]?.next
//            result?.next = ListNode(minVal)
//            result = result?.next
//        }
//    }
//
//    return resultHead?.next
//}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count <= 0 { return nil }
    if lists.count == 1 { return lists[0] }

    var lists = lists
    var currentCnt = lists.count

    while(currentCnt > 1) {
        let loops = currentCnt/2
        let targetCnt = (currentCnt+1)/2

        for i in 0..<loops {
            lists[i] = merge(lists[i], lists[i+targetCnt])
        }

        currentCnt = targetCnt
    }

    return lists[0]
}

private func merge(_ listA: ListNode?, _ listB: ListNode?) -> ListNode? {
    if listA == nil { return listB }
    if listB == nil { return listA }
    if listA === listB { return listA }

    let headA = ListNode()
    headA.next = listA
    var preA: ListNode? = headA

    var nodeA = listA
    var nodeB = listB
    while(nodeA != nil && nodeB != nil) {
        if nodeB!.val < nodeA!.val {
            let temp = nodeB?.next
            insertAfter(preA, nodeB)
            nodeA = nodeB
            nodeB = temp
        } else {
            while(nodeA != nil && nodeA!.val <= nodeB!.val) {
                preA = nodeA
                nodeA = nodeA?.next
            }

            let temp = nodeB?.next
            insertAfter(preA, nodeB)
            nodeA = nodeB
            nodeB = temp
        }
    }

    return headA.next
}

private func insertAfter(_ node: ListNode?, _ newNode: ListNode?) {
    guard node != nil else { return }

    let next = node?.next
    node?.next = newNode
    newNode?.next = next
}
