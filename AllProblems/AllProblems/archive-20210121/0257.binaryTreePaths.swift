//
//  0257.binaryTreePaths.swift
//  AllProblems
//
//  Created by liuning on 2020/12/29.
//

import Foundation

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var res = [String]()
    travel(root, [], &res)
    return res
}

private func travel(_ root: TreeNode?, _ path: [Int], _ res: inout [String]) {
    guard root != nil else { return }

    let newPath = path + [root!.val]

    if root?.left == nil && root?.right == nil {
        res.append(generatePathString(newPath))
        return
    }

    if root?.left != nil { travel(root?.left, path + [root!.val], &res) }
    if root?.right != nil { travel(root?.right, path + [root!.val], &res) }
}

private func generatePathString(_ path: [Int]) -> String {
    var res = ""
    for (idx, node) in path.enumerated() {
        res += String(node)
        if idx != path.count-1 {
            res += "->"
        }
    }
    return res
}
