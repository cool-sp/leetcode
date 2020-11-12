//
//  preorder.swift
//  NaryTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/n-ary-tree/130/traversal/925/

import Foundation

func preorder(_ root: Node?) -> [Int] {
    var result = [Int]()
    visit(root, &result)
    return result
}

private func visit(_ node: Node?, _ result: inout [Int]) {
    if let node = node {
        result.append(node.val)
        for child in node.children {
            visit(child, &result)
        }
    }
}
