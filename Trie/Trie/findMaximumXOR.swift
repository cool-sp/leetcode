//
//  findMaximumXOR.swift
//  Trie
//
//  Created by liuning on 2020/11/13.
//

// https://leetcode.com/explore/learn/card/trie/149/practical-application-ii/1057/

import Foundation

func findMaximumXOR(_ nums: [Int]) -> Int {
    if nums.count < 0 { return Int.min }

    let binaryStrings = process(nums)
    let trie = TrieEx2()
    for idx in 0..<binaryStrings.count {
        trie.insert(binaryStrings[idx], nums[idx])
    }

    var maxXOR = Int.min
    for idx in 0..<binaryStrings.count {
        let currVal = nums[idx]
        let currStr = binaryStrings[idx]

        var node = trie.root
        for ch in currStr {
            let flipped: Character = ch == "0" ? "1" : "0"
            if let nd = node.children[flipped] {
                node = nd
            } else {
                node = node.children[ch]!
            }
        }

        let foundVal = node.val
        let currXOR = currVal ^ foundVal
        if currXOR > maxXOR { maxXOR = currXOR }
    }

    return maxXOR
}

func toBinaryString(_ val: Int) -> String {
    return String(val, radix: 2)
}

func addLeadingZero(_ str: inout String, _ countZero: Int) {
    let prefix = String(repeating: "0", count: countZero)
    str = prefix + str
}

func process(_ nums: [Int]) -> [String] {
    var result = [String]()
    var maxLen = 0

    for num in nums {
        let str = toBinaryString(num)
        let len = str.count

        if len > maxLen { maxLen =  len }
        result.append(str)
    }

    for idx in 0..<result.count {
        let len = result[idx].count
        if len < maxLen {
            addLeadingZero(&result[idx], maxLen-len)
        }
    }

    return result
}


class TrieEx2Node {
    var children = [Character: TrieEx2Node]()
    let char: Character?
    var val: Int

    init(_ ch: Character? = nil) {
        self.char = ch
        self.val = 0
    }
}

class TrieEx2 {
    let root = TrieEx2Node()

    func insert(_ word: String, _ val: Int) {
        var node = root
        for char in word {
            if let next = node.children[char] {
                node = next
            } else {
                let newNode = TrieEx2Node(char)
                node.children[char] = newNode
                node = newNode
            }
        }
        node.val = val
    }
}
