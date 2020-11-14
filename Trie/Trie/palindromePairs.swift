//
//  palindromePairs.swift
//  Trie
//
//  Created by liuning on 2020/11/13.
//

// https://leetcode.com/explore/learn/card/trie/149/practical-application-ii/1138/

import Foundation

class TrieExNode {
    var children = [Character: TrieExNode]()
    let char: Character?
    var isWord: Bool
    var record = [(Int, Int)]() // nth, j

    init(_ ch: Character? = nil) {
        self.char = ch
        self.isWord = false
    }
}

class TrieEx {
    let root = TrieExNode()

    init() {}

    func insert(_ word: String, _ nth: Int) {
        var node = root
        node.record.append((nth, word.count))

        var j = word.count - 1
        for char in word {
            if let next = node.children[char] {
                node = next
            } else {
                let newNode = TrieExNode(char)
                node.children[char] = newNode
                node = newNode
            }

            node.record.append((nth, j))
            j -= 1
        }
        node.isWord = true
    }

    func match(_ word: String) -> [(Int, TrieExNode)] {
        var node = root
        var remaingCnt = word.count
        var cntZeroAdded = false

        var result = [(Int, TrieExNode)]()

        // for empty string
        if node.isWord {
            result.append((remaingCnt, node))
            if remaingCnt == 0 {
                cntZeroAdded = true
            }
        }

        // try to match the reversed trie
        for char in word {
            if let next = node.children[char] {
                node = next
                remaingCnt -= 1

                if node.isWord {
                    result.append((remaingCnt, node))
                    if remaingCnt == 0 {
                        cntZeroAdded = true
                    }
                }
            } else {
                break
            }
        }

        // all the reversed trie are matched
        // but self hasn't reached the end yet
        if remaingCnt == 0 && !cntZeroAdded {
            result.append((remaingCnt, node))
        }

        return result
    }

    func getWordIndex(_ node: TrieExNode, _ exclude: Int) -> [Int] {
        if !node.isWord { return [] }

        var result = [Int]()
        for (nth, j) in node.record {
            if j == 0 { result.append(nth) }
        }


        return result.filter { $0 != exclude }
    }
}

extension String {
    subscript(idx: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: idx)
        return self[index]
    }

    subscript(range: Range<Int>) -> String {
        let loIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let hiIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[loIndex..<hiIndex])
    }
}

func palindromePairs(_ words: [String]) -> [[Int]] {
    guard words.count > 0 else { return [] }
    var result = [[Int]]()

    // build trie
    let trie = TrieEx()
    for idx in 0..<words.count {
        trie.insert(String(words[idx].reversed()), idx)
    }

    for idx in 0..<words.count {
        let matches = trie.match(words[idx])

        for (remainingCnt, node) in matches {
            if remainingCnt == 0 {
                for (nth, j) in node.record {
                    if idx != nth && isPalindrome(words[nth], 0, j) {
                        result.append([idx, nth])
                    }
                }
            } else {
                for nth in trie.getWordIndex(node, idx) {
                    if isPalindrome(words[idx], words[idx].count-remainingCnt, words[idx].count) {
                        result.append([idx, nth])
                    }
                }
            }
        }
    }

    return result
}

func isPalindrome(_ str: String, _ from: Int, _ to: Int) -> Bool {
    if from == to { return true }
    let substring = str[from..<to]
    if substring.isEmpty { return true }

    var left = from
    var right = to-1
    while(left < right && str[left] == str[right]) {
        left += 1
        right -= 1
    }
    return left >= right
}
