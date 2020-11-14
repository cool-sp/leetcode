//
//  replaceWords.swift
//  Trie
//
//  Created by liuning on 2020/11/13.
//

// https://leetcode.com/explore/learn/card/trie/148/practical-application-i/1053/

import Foundation

func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    guard sentence.count > 0 else { return "" }

    let trie = Trie()
    for str in dictionary {
        trie.insert(str)
    }

    var result = Array(sentence)
    var p1 = 0
    var p2 = 1
    var w = 0
    while(p2 < result.count) {
        if type(result[p2]) != type(result[p1]) {
            let substr = String(result[p1..<p2])
            let converted = trie.shortestMatch(substr)
            for ch in converted { result[w] = ch; w += 1 }
            p1 = p2
        }
        p2 += 1
    }

    let substr = String(result[p1..<p2])
    let converted = trie.shortestMatch(substr)
    for ch in converted { result[w] = ch; w += 1 }

    return String(result[0..<w])
}

private func type(_ ch: Character) -> Int {
    if ch == " " {
        return 0
    } else {
        return 1
    }
}
