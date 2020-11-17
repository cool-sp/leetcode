//
//  reverseWords2.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/204/conclusion/1165/

import Foundation

func reverseWords2(_ s: String) -> String {
    var s = Array(s)

    var i = -1
    var p = 0
    while(p < s.count) {
        if s[p] != " " && i < 0 { i = p }
        if i >= 0 { break }
        p += 1
    }

    if i < 0 { return "" }
    while(i < s.count) {
        var j = i
        while(j < s.count && s[j] != " ") { j += 1 }
        revert(&s, i, j-1)

        i = j
        while(i < s.count && s[i] == " ") { i += 1 }
    }

    return String(s)
}

private func revert(_ s: inout [Character], _ i: Int, _ j: Int) {
    if s.count <= 1 { return }
    if i > j { return }

    var i = i
    var j = j
    while(i <= j) {
        let temp = s[i]
        s[i] = s[j]
        s[j] = temp

        i += 1
        j -= 1
    }
}
