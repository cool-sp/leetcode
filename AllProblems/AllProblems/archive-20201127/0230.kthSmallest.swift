//
//  0230.kthSmallest.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root = root else { return Int.min }
    guard k > 0 else { return Int.min }

    var map = [ObjectIdentifier: (Int, Int)]()
    buildMap(root, &map)

    return lookup(root, map, k)
}

private func lookup(_ root: TreeNode?, _ map: [ObjectIdentifier: (Int, Int)], _ k: Int) -> Int {
    guard let root = root else { return Int.min }

    let (leftCount, _) = map[ObjectIdentifier(root)]!
    if k <= leftCount {
        return lookup(root.left, map, k)
    } else if k == leftCount + 1 {
        return root.val
    } else {
        return lookup(root.right, map, k-1-leftCount)
    }
}

private func buildMap(_ root: TreeNode?, _ map: inout [ObjectIdentifier: (Int, Int)]) -> Int {
    guard let root = root else { return 0 }

    var leftCount = 0
    if root.left != nil {
        leftCount = buildMap(root.left, &map)
    }

    var rightCount = 0
    if root.right != nil {
        rightCount = buildMap(root.right, &map)
    }

    map[ObjectIdentifier(root)] = (leftCount, rightCount)
    return leftCount + rightCount + 1
}
