//
//  0140.wordBreak.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

func wordBreak140(_ s: String, _ wordDict: [String]) -> [String] {
    if s.count <= 0 { return [] }
    if wordDict.count <= 0 { return [] }

    let s = Array(s)
    var cache = [Int: ([[[Character]]], Bool)]()
    var maxWordLen = Int.min
    var wordSet = Set<String>()
    for word in wordDict {
        wordSet.insert(word)
        maxWordLen = max(maxWordLen, word.count)
    }

    var result = [String]()
    let val = breakWord(s, wordSet, maxWordLen, 0, &cache)
    if !val.1 {
        return []
    } else {
        for line in val.0 {
            var temp = ""
            for str in line {
                temp += Array(str)
                temp += " "
            }
            temp.removeLast()
            result.append(temp)
        }
    }

    return result
}

private func breakWord(_ s: [Character],
                       _ wordSet: Set<String>,
                       _ maxWordLen: Int,
                       _ offset: Int,
                       _ cache: inout [Int: ([[[Character]]], Bool)]) -> ([[[Character]]], Bool) {
    if offset >= s.count {
        return ([], true)
    }

    if cache[offset] != nil {
        return cache[offset]!
    }

    var result = [[[Character]]]()
    for len in 1..<maxWordLen+1 {
        if offset+len > s.count { break }
        let str = String(s[offset..<offset+len])
        if wordSet.contains(str) {
            var sub = breakWord(s, wordSet, maxWordLen, offset+len, &cache)
            if sub.1 {
                if sub.0.isEmpty {
                    result.append([Array(str)])
                } else {
                    for subidx in 0..<sub.0.count {
                        sub.0[subidx].insert(Array(str), at: 0)
                    }
                    result.append(contentsOf: sub.0)
                }
            }
        }
    }

    let ret = (result, result.count > 0)
    cache[offset] = ret
    return ret
}
