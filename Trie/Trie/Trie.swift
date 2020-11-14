//
//  Trie.swift
//  Trie
//
//  Created by liuning on 2020/11/12.
//

// https://leetcode.com/explore/learn/card/trie/147/basic-operations/1047/

import Foundation

class TrieNode {
    var children = [Character: TrieNode]()
    let char: Character?
    var isWord: Bool

    init(_ ch: Character? = nil) {
        self.char = ch
        self.isWord = false
    }
}

class Trie {
    let root = TrieNode()

    init() {}

    func insert(_ word: String) {
        var node = root
        for char in word {
            if let next = node.children[char] {
                node = next
            } else {
                let newNode = TrieNode(char)
                node.children[char] = newNode
                node = newNode
            }
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        return searchWord(word, false)
    }

    func startsWith(_ prefix: String) -> Bool {
        return searchWord(prefix, true)
    }

    // for replaceWords.swift
    func shortestMatch(_ word: String) -> String {
        var matched = [Character]()
        var node = root
        for char in word {
            if let next = node.children[char] {
                node = next
                if let ch = node.char {
                    matched.append(ch)
                }
                if node.isWord {
                    return String(matched)
                }
            } else {
                return word
            }
        }
        return word
    }

    private func searchWord(_ word: String, _ ignoreWord: Bool) -> Bool {
        var node = root
        for char in word {
            if let next = node.children[char] {
                node = next
            } else {
                return false
            }
        }

        return ignoreWord ? true : node.isWord
    }
}
