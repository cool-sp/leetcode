//
//  insertIntoBST.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/141/basic-operations-in-a-bst/1003/

import Foundation

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var node = root
    var prev: TreeNode? = nil
    while(node != nil) {
        if node!.val < val {
            prev = node
            node = node!.right
        } else {
            prev = node
            node = node!.left
        }
    }

    if prev == nil {
        return TreeNode(val)
    } else {
        if prev!.val < val {
            prev?.right = TreeNode(val)
        } else {
            prev?.left = TreeNode(val)
        }
    }

    return root
}
