//
//  searchBST.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/141/basic-operations-in-a-bst/1000/

import Foundation

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var node = root
    while(node != nil) {
        if node!.val == val  {
            return node
        } else if node!.val < val {
            node = node!.right
        } else {
            node = node!.left
        }
    }
    return node
}
