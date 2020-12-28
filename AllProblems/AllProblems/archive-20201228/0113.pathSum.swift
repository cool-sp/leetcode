//
//  0113.pathSum.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var path = [Int]()
    var res = [[Int]]()

    pathSumHelper(root, sum, &path, &res)
    return res
}

private func pathSumHelper(_ root: TreeNode?, _ target: Int, _ path: inout [Int], _ res: inout [[Int]]) {
    guard let root = root else { return }

    path.append(root.val)
    if root.left == nil && root.right == nil && root.val == target {
        res.append(path)
        path.removeLast()
        return
    }

    let remaining = target - root.val
    pathSumHelper(root.left, remaining, &path, &res)
    pathSumHelper(root.right, remaining, &path, &res)
    
    path.removeLast()
}
