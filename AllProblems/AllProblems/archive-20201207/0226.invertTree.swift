//
//  0226.invertTree.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil { return nil }

    let lft = root?.left
    let rht = root?.right

    root?.left = rht
    root?.right = lft

    invertTree(lft)
    invertTree(rht)

    return root
}
