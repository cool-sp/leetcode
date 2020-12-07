//
//  0538.convertBST.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func convertBST(_ root: TreeNode?) -> TreeNode? {
    if root == nil { return nil }
    convert(root, 0)
    return root
}

private func convert(_ root: TreeNode?, _ carryover: Int) -> Int {
    if root == nil { return carryover }

    let rht = convert(root?.right, carryover)
    root?.val += rht
    let lft = convert(root?.left, root!.val)

    return lft
}
