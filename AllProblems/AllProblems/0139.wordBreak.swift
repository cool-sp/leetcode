//
//  0139.wordBreak.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    if wordDict.count <= 0 { return false }
    let s = Array(s)
    var maxWordLen = Int.min
    var wordSet = Set<String>()
    for word in wordDict {
        wordSet.insert(word)
        maxWordLen = max(maxWordLen, word.count)
    }

    var dp = Array(repeating: false, count: s.count+1)
    dp[0] = true

    for i in 1...s.count {
        for j in 1...maxWordLen {
            if i-j >= 0 {
                let str = String(s[i-j..<i])
                if wordSet.contains(str) {
                    dp[i] = dp[i] || dp[i-j]
                    if dp[i] == true { break }
                }
            }
        }
    }

    return dp[s.count]
}

//class TrieNode {
//    var ch: Character?
//    var child = [Character: TrieNode]()
//    var isWord: Bool
//
//    init(_ ch: Character? = nil) {
//        self.ch = ch
//        self.isWord = false
//    }
//}
//
//class Trie {
//    let root = TrieNode()
//
//    init() {}
//
//    func add(_ word: String) {
//        if word.count < 0 { return }
//        var curr = root
//        for ch in word {
//            if let next = curr.child[ch] {
//                curr = next
//            } else {
//                let newNode = TrieNode(ch)
//                curr.child[ch] = newNode
//                curr = newNode
//            }
//        }
//        curr.isWord = true
//    }
//
//    func lookup(_ s: [Character], _ offset: Int) -> [Int] {
//        if offset >= s.count { return [offset] }
//
//        var offset = offset
//        var result = [Int]()
//        var node: TrieNode? = root
//        while(offset < s.count) {
//            let ch = s[offset]
//            if let next = node?.child[ch] {
//                if next.isWord {
//                    result.append(offset+1)
//                }
//                offset += 1
//                node = next
//            } else {
//                break
//            }
//        }
//
//        return result
//    }
//}
//
//func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//    if s.count <= 0 { return false }
//    if wordDict.count <= 0 { return false }
//
//    let trie = Trie()
//    for word in wordDict {
//        trie.add(word)
//    }
//
//    var visitedOffset = Set<Int>()
//    return lookup(Array(s), Set([0]), &visitedOffset, trie)
//}
//
//private func lookup(_ s: [Character], _ offsets: Set<Int>, _ visitedOffset: inout Set<Int>, _ trie: Trie) -> Bool {
//    if offsets.isEmpty { return false }
//
//    var nextOffsets = Set<Int>()
//    for offset in offsets {
//        // avoid duplicated lookup - for performance reason
//        if visitedOffset.contains(offset) { continue }
//
//        let newOffsets = trie.lookup(s, offset)
//
//        if newOffsets.contains(s.count) {
//            return true
//        } else {
//            nextOffsets = nextOffsets.union(newOffsets)
//        }
//    }
//
//    return lookup(s, nextOffsets, &visitedOffset, trie)
//}
