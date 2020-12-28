//
//  0099.recoverTree.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func recoverTree(_ root: TreeNode?) {
    var firstMax: TreeNode? = nil
    var lastMin: TreeNode? = nil
    var prev: TreeNode? = nil

    travel(root, &firstMax, &lastMin, &prev)
    let temp = firstMax!.val
    firstMax!.val = lastMin!.val
    lastMin!.val = temp
}

private func travel(_ root: TreeNode?, _ firstMax: inout TreeNode?, _ lastMin: inout TreeNode?, _ prev: inout TreeNode?) {
    guard let root = root else { return }

    travel(root.left, &firstMax, &lastMin, &prev)

    let curr = root
    if let prev = prev {
        if prev.val > curr.val {
            if firstMax == nil {
                firstMax = prev
            } else {
                firstMax = prev.val > firstMax!.val ? prev : firstMax
            }

            if lastMin == nil {
                lastMin = curr
            } else {
                lastMin = curr.val < lastMin!.val ? curr : lastMin
            }
        }
    }
    prev = curr

    travel(root.right, &firstMax, &lastMin, &prev)
}
