//
//  isBalanced.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/143/appendix-height-balanced-bst/1027/

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    var isBalanced = true
    depth(root, &isBalanced)

    return isBalanced
}

private func depth(_ root: TreeNode?, _ isBalanced: inout Bool) -> Int {
    if root == nil { return 0 }
    if !isBalanced { return 0 }

    let depthL = depth(root?.left, &isBalanced)
    let depthR = depth(root?.right, &isBalanced)

    if abs(depthL - depthR) <= 1 {
        return max(depthL, depthR) + 1
    } else {
        isBalanced = false
        return 0
    }
}
