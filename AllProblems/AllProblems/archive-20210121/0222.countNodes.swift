//
//  0222.countNodes.swift
//  AllProblems
//
//  Created by liuning on 2020/12/28.
//

import Foundation

func countNodes(_ root: TreeNode?) -> Int {
    if root == nil { return 0}

    let left = countNodes(root?.left)
    let right = countNodes(root?.right)
    return left + right + 1
}
