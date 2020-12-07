//
//  0617.mergeTrees.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    if t1 == nil {
        return t2
    } else if t2 == nil {
        return t1
    } else {
        t1!.val += t2!.val
        t1!.left = mergeTrees(t1?.left, t2?.left)
        t1!.right = mergeTrees(t1?.right, t2?.right)
    }

    return t1
}
