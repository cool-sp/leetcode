//
//  isValidBST.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/140/introduction-to-a-bst/997/

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    return isValidBST(root, Int.min, Int.max)
}

private func isValidBST(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
    guard let node = node else { return true }
    if node.val <= min || node.val >= max { return false}

    let leftResult = isValidBST(node.left, min, node.val)
    let rightResult = isValidBST(node.right, node.val, max)
    return leftResult && rightResult
}
