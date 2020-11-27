//
//  0103.zigzagLevelOrder.swift
//  AllProblems
//
//  Created by liuning on 2020/11/21.
//

import Foundation

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil { return [] }

    var leftStack = [TreeNode?]()
    var rightStack = [TreeNode?]()

    leftStack.append(root)
    var addRightFirst = false
    var result = [[Int]]()

    while(!leftStack.isEmpty || !rightStack.isEmpty) {
        var path = [Int]()
        if addRightFirst {
            appendToStack(&rightStack, &leftStack, addRightFirst, &path)
        } else {
            appendToStack(&leftStack, &rightStack, addRightFirst, &path)
        }

        addRightFirst = !addRightFirst
        result.append(path)
    }

    return result
}

private func appendToStack(_ fromStack: inout [TreeNode?],
                           _ toStack: inout [TreeNode?],
                           _ addRightFirst: Bool,
                           _ path: inout [Int]) {
    while(!fromStack.isEmpty) {
        if let node = fromStack.removeLast() {
            path.append(node.val)

            if addRightFirst {
                if node.right != nil { toStack.append(node.right) }
                if node.left != nil { toStack.append(node.left) }
            } else {
                if node.left != nil { toStack.append(node.left) }
                if node.right != nil { toStack.append(node.right) }
            }
        }
    }
}
