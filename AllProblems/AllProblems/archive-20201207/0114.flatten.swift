//
//  0114.flatten.swift
//  AllProblems
//
//  Created by liuning on 2020/12/6.
//

import Foundation

func flatten(_ root: TreeNode?) {
    travel(root)
}

private func travel(_ root: TreeNode?) -> (TreeNode?, TreeNode?) {
    guard let root = root else { return (nil, nil) }

    if root.left == nil && root.right == nil {
        return (root, root)
    } else if root.left == nil {
        let (head, next) = travel(root.right)
        root.left = nil
        root.right = head
        return (root, next)
    } else if root.right == nil {
        let (head, next) = travel(root.left)
        root.left = nil
        root.right = head
        return (root, next)
    } else {
        let (lhead, lnext) = travel(root.left)
        let (rhead, rnext) = travel(root.right)
        root.left = nil
        root.right = lhead
        lnext?.right = rhead
        return (root, rnext)
    }
}
