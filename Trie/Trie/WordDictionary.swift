//
//  WordDictionary.swift
//  Trie
//
//  Created by liuning on 2020/11/13.
//

// https://leetcode.com/explore/learn/card/trie/148/practical-application-i/1052/

import Foundation

class WordDictionaryNode {
    var children = [Character: WordDictionaryNode]()
    let char: Character?
    var isWord: Bool

    init(_ ch: Character? = nil) {
        self.char = ch
        self.isWord = false
    }
}

class WordDictionary {

    let root = WordDictionaryNode()

    init() {}

    func addWord(_ word: String) {
        var node = root
        for char in word {
            if let next = node.children[char] {
                node = next
            } else {
                let newNode = WordDictionaryNode(char)
                node.children[char] = newNode
                node = newNode
            }
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        var candidates = [root]

        for ch in word {
            if search(&candidates, ch) == false {
                return false
            }
        }

        return candidates.contains(where: {$0.isWord} )
    }

    private func search(_ candidates: inout [WordDictionaryNode], _ ch: Character) -> Bool {
        if candidates.count <= 0 { return false }

        var result = [WordDictionaryNode]()
        for node in candidates {
            if ch == "." {
                result += node.children.values
            } else if let child = node.children[ch] {
                result.append(child)
            }
        }

        candidates = result
        return !result.isEmpty
    }
}
