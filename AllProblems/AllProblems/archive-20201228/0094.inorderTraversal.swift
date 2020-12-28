//
//  0094.inorderTraversal.swift
//  AllProblems
//
//  Created by liuning on 2020/12/14.
//

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var node = root
    var stack = [TreeNode]()
    var res = [Int]()

    while node != nil || !stack.isEmpty {

        while node != nil {
            stack.append(node!)
            node = node?.left
        }

        node = stack.removeLast()
        res.append(node!.val)

        node = node?.right
    }

    return res
}
