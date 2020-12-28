//
//  0111.minDepth.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func minDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }

    let left = root?.left == nil ? Int.max : minDepth(root?.left)
    let right = root?.right == nil ? Int.max : minDepth(root?.right)
    let minVal = min(left, right)

    if minVal == Int.max { return 1 }
    else { return minVal + 1}
}
