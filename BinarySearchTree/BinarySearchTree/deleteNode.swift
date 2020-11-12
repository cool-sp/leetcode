//
//  deleteNode.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/141/basic-operations-in-a-bst/1006/

import Foundation

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    return deleteNode(root, key, nil, true)
}

func deleteNode(_ node: TreeNode?, _ key: Int, _ parent: TreeNode?, _ isLeft: Bool) -> TreeNode? {
    guard let node = node else { return nil }

    if key < node.val {
        deleteNode(node.left, key, node, true)
        return node
    } else if key > node.val {
        deleteNode(node.right, key, node, false)
        return node
    } else {
        if node.left == nil || node.right == nil {
            let newNode = node.left ?? node.right
            if parent != nil {
                if isLeft {
                    parent?.left = newNode
                } else {
                    parent?.right = newNode
                }
            }
            return newNode
        } else {
            (node.right, node.val) = deleteLeftmost(node.right!)
            return node
        }
    }
}

private func deleteLeftmost(_ node: TreeNode) -> (TreeNode?, Int) {
    var nd = node
    var parent: TreeNode? = nil
    while(nd.left != nil) {
        parent = nd
        nd = nd.left!
    }

    if parent == nil {
        return (nd.right, nd.val)
    }
    else {
        parent?.left = nd.right
        return (node, nd.val)
    }
}
