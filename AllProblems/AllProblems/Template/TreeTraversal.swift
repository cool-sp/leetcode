//
//  TreeInorderVisit.swift
//  AllProblems
//
//  Created by liuning on 2020/12/14.
//

import Foundation

// https://leetcode-cn.com/leetbook/read/data-structure-binary-tree/xeywh5/
private func _preorderTraversal(_ root: TreeNode?) -> [Int] {
    var node = root
    var stack = [TreeNode]()
    var res = [Int]()

    while node != nil || !stack.isEmpty {
        while node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node?.left
        }

        node = stack.removeLast()

        node = node?.right
    }

    return res
}

// https://leetcode-cn.com/leetbook/read/data-structure-binary-tree/xecaj6/
private func _inorderTraversal(_ root: TreeNode?) -> [Int] {
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

// https://leetcode-cn.com/leetbook/read/data-structure-binary-tree/xebrb2/
// key point is the using pre-order but right child goes into stack first
// and the reverse the result array
private func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var node = root
    var stack = [TreeNode]()
    var res = [Int]()

    while node != nil || !stack.isEmpty {
        while node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node?.right
        }

        node = stack.removeLast()

        node = node?.left
    }

    return res.reversed()
}
