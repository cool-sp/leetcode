//
//  cloneGraph.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/232/practical-application-stack/1392/

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

extension Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    var map = [Node: Node]()
    return clone(node, &map)
}

private func clone(_ node: Node?, _ map: inout [Node: Node]) -> Node? {
    guard let node = node else { return nil }

    if map[node] == nil {
        let cloned = Node(node.val)
        map[node] = cloned

        for nb in node.neighbors {
            cloned.neighbors.append(clone(nb, &map))
        }

        return cloned
    } else {
        return map[node]
    }
}
