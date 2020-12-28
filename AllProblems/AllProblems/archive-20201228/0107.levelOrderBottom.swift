//
//  0107.levelOrderBottom.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()
    travel(root, 0, &res)

    for i in 0..<res.count/2 {
        let temp = res[i]
        res[i] = res[res.count-1-i]
        res[res.count-1-i] = temp
    }

    return res
}

private func travel(_ root: TreeNode?, _ level: Int, _ res: inout [[Int]]) {
    guard let root = root else { return }

    if level >= res.count {
        res.append([root.val])
    } else {
        res[level].append(root.val)
    }

    travel(root.left, level+1, &res)
    travel(root.right, level+1, &res)
}
