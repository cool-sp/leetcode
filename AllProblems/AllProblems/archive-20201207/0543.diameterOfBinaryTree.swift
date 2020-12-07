//
//  0543.diameterOfBinaryTree.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    var maxDiameter = 0

    let lft = height(root?.left, &maxDiameter)
    let rht = height(root?.right, &maxDiameter)

    return max(lft+rht, maxDiameter)
}


private func height(_ root: TreeNode?, _ maxDiameter: inout Int) -> Int {
    if root == nil { return 0 }

    let lft = height(root?.left, &maxDiameter)
    let rht = height(root?.right, &maxDiameter)

    maxDiameter = max(lft+rht, maxDiameter)
    return max(lft, rht) + 1
}
