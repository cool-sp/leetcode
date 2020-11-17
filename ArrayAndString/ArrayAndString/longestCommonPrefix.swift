//
//  longestCommonPrefix.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/203/introduction-to-string/1162/

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count <= 0 { return "" }
    if strs.count == 1 { return strs[0] }

    let strs = strs.map { Array($0) }

    var isEnded = false
    var i = 0
    while(i < strs[0].count) {
        var idx = 1
        while(idx < strs.count) {
            if i >= strs[idx].count {
                isEnded = true
                break
            } else if strs[idx][i] != strs[0][i] {
                isEnded = true
                break
            }
            idx += 1
        }
        if isEnded { break }
        i += 1
    }

    return String(strs[0][0..<i])
}
