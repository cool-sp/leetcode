//
//  0124.maxPathSum.swift
//  AllProblems
//
//  Created by liuning on 2020/11/22.
//

import Foundation

func maxPathSum(_ root: TreeNode?) -> Int {
    var result = Int.min
    calculate(root, &result)
    return result
}

private func calculate(_ root: TreeNode?, _ result: inout Int) -> Int {
    guard let root = root else { return 0 }

    if root.left == nil && root.right == nil {
        result = max(result, root.val)
        return root.val
    } else {
        let left = calculate(root.left, &result)
        let right = calculate(root.right, &result)

        let leftSum = left < 0 ? 0 : left
        let rightSum = right < 0 ? 0 : right

        let pathSum1 = root.val + max(leftSum, rightSum)
        let pathSum2 = root.val + leftSum + rightSum
        result = max(result, max(pathSum1, pathSum2))
        return pathSum1
    }
}
