//
//  BSTIterator.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/140/introduction-to-a-bst/1008/

import Foundation

class BSTIterator {

    var chain = [TreeNode]()
    var pos = -1

    init(_ root: TreeNode?) {
        build(root, &chain)
    }

    func next() -> Int {
        if hasNext() {
            pos += 1
            return chain[pos].val
        }
        return Int.min
    }

    func hasNext() -> Bool {
        if chain.count <= 0 {
            return false
        }

        return pos < chain.count - 1
    }

    private func build(_ node: TreeNode?, _ chain: inout [TreeNode]) {
        guard let node = node else { return }
        if let left = node.left {
            build(left, &chain)
        }
        chain.append(node)
        if let right = node.right {
            build(right, &chain)
        }
    }
}
