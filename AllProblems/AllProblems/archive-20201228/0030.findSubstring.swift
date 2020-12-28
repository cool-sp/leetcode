//
//  0030.findSubstring.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    var targetMap = [String: Int]()
    for str in words {
        targetMap[str, default:0] += 1
    }
    let wordCount = words.count
    let wordLen = words[0].count
    let s = Array(s)

    var res = [Int]()
    var i = 0
    while i < s.count - (wordCount * wordLen) + 1 {
        if checkIfMatched(s, i, targetMap, wordCount, wordLen) {
            res.append(i)
        }
        i += 1
    }

    return res
}

private func checkIfMatched(_ s: [Character],
                            _ offset: Int,
                            _ targetMap: [String: Int],
                            _ wordCount: Int,
                            _ wordLen: Int) -> Bool {

    var currMap = targetMap
    var i = 0
    while i < wordCount {
        let wordIdx = offset + wordLen * i
        let str = String(s[wordIdx..<wordIdx+wordLen])
        if currMap[str] == nil || currMap[str]! <= 0 {
            return false
        } else {
            currMap[str]! -= 1
        }
        i += 1
    }

    return true
}
