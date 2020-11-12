//
//  lowestCommonAncestor.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/142/conclusion/1012/

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if let root = root, let p = p, let q = q {
        return common(root, p.val, q.val)
    }
    return nil
}

private func common(_ root:TreeNode?, _ p: Int, _ q: Int) -> TreeNode? {
    guard let root = root else { return nil }

    let val = root.val
    if p<val && q<val {
        return common(root.left, p, q)
    } else if p>val && q>val {
        return common(root.right, p, q)
    } else {
        return root
    }
}
