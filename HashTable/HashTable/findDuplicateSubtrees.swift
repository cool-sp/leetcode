//
//  findDuplicateSubtrees.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/185/hash_table_design_the_key/1127/

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var map = [String: [TreeNode]]()
    var answer = [TreeNode?]()

    preorder(root, &map)

    for (_, nodes) in map {
        if nodes.count > 1 { answer.append(nodes.first!) }
    }

    return answer
}

private func preorder(_ node: TreeNode?,
                      _ map: inout [String: [TreeNode]]) -> String {

    if let node = node {
        let curr = String(node.val)
        let left = preorder(node.left, &map)
        let right = preorder(node.right, &map)
        let str = curr + "," + left + "," + right

        if map[str] == nil {
            map[str] = [node]
        } else {
            map[str]?.append(node)
        }
        return str
    }

    return "#"
}
