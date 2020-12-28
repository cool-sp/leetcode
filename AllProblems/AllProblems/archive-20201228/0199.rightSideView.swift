//
//  0199.rightSideView.swift
//  AllProblems
//
//  Created by liuning on 2020/12/27.
//

import Foundation

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard root != nil else { return [] }

    var res = [Int]()
    var queue = [TreeNode]()
    queue.append(root!)

    while !queue.isEmpty {
        res.append(queue.last!.val)

        let count = queue.count

        for i in 0..<queue.count {
            let left = queue[i].left
            let right = queue[i].right

            if left != nil { queue.append(left!) }
            if right != nil { queue.append(right!) }
        }

        queue.removeFirst(count)
    }

    return res
}
