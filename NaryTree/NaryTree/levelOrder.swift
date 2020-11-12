//
//  levelOrder.swift
//  NaryTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/n-ary-tree/130/traversal/915/

import Foundation

func levelOrder(_ root: Node?) -> [[Int]] {
    if let root = root {
        var result = [[Int]]()
        var path = [Node]()

        path.append(root)
        var count = 1
        var layer = [Int]()
        while(count > 0) {
            let node = path.removeFirst()
            layer.append(node.val)

            for child in node.children {
                path.append(child)
            }

            count -= 1
            if count == 0 {
                result.append(layer)
                layer = []
                count = path.count
            }
        }

        return result
    }
    return []
}
