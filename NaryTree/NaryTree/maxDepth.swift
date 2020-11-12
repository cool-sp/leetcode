//
//  maxDepth.swift
//  NaryTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/n-ary-tree/131/recursion/919/

import Foundation

func maxDepth(_ root: Node?) -> Int {
    if let root = root {
        var max = 0
        visit(root, 1, &max)
        return max
    } else {
        return 0
    }
}


private func visit(_ root: Node, _ depth: Int, _ maxDepth: inout Int) {
    if depth > maxDepth {
        maxDepth = depth
    }

    for child in root.children {
        visit(child, depth + 1, &maxDepth)
    }
}
