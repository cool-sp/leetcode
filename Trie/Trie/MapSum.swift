//
//  MapSum.swift
//  Trie
//
//  Created by liuning on 2020/11/12.
//

// https://leetcode.com/explore/learn/card/trie/148/practical-application-i/1058/

import Foundation

class MapSumNode {
    var children = [Character: MapSumNode]()
    let char: Character?
    var val: Int
    var wordVal: Int?

    init(_ ch: Character? = nil) {
        self.char = ch
        self.val = 0
    }
}

class MapSum {

    let root = MapSumNode()

    init() {}

    func insert(_ key: String, _ val: Int) {
        var node = root
        node.val += val
        var path = [MapSumNode]()
        path.append(node)

        for char in key {
            if let next = node.children[char] {
                node = next
                node.val += val
                path.append(node)
            } else {
                let newNode = MapSumNode(char)
                newNode.val = val
                node.children[char] = newNode
                node = newNode
            }
        }

        if let wordVal = node.wordVal {
            for nd in path {
                nd.val -= wordVal
            }
        }
        node.wordVal = val
    }

    func sum(_ prefix: String) -> Int {
        var node = root
        for char in prefix {
            if let next = node.children[char] {
                node = next
            } else {
                return 0
            }
        }

        return node.val
    }
}
