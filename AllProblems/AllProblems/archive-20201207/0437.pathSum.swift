//
//  0437.pathSum.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    var res = 0
    var map = [Int: Int]()
    map[0] = 1
    travel(root, sum, 0, &map, &res)
    return res
}

private func travel(_ root: TreeNode?, _ targetSum: Int, _ preSum: Int, _ map: inout [Int: Int], _ res: inout Int) {
    guard let root = root else { return }

    let curPreSum = preSum + root.val
    if let cnt = map[curPreSum - targetSum] {
        res += cnt
    }
    map[curPreSum, default:0] += 1

    travel(root.left, targetSum, curPreSum, &map, &res)
    travel(root.right, targetSum, curPreSum, &map, &res)

    map[curPreSum]! -= 1 // reset
}
