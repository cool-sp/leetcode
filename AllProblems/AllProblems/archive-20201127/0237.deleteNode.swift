//
//  0237.deleteNode.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func deleteNode(_ node: ListNode?) {
    if let node = node {
        node.val = node.next!.val
        node.next = node.next!.next
    }
}
