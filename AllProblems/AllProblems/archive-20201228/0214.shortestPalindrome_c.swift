//
//  0214.shortestPalindrome.swift
//  AllProblems
//
//  Created by liuning on 2020/12/27.
//

import Foundation

func shortestPalindrome(_ s: String) -> String {
    guard s.count > 0 else { return "" }

    let s = Array(s)

    let next = buildNextTable2(s + "#" + s.reversed())
    let lastIdx = next.last!
    return String(s[lastIdx..<s.count].reversed() + s)
}

func buildNextTable2(_ s: [Character]) -> [Int] {
    guard s.count > 0 else { return [] }

    var j = 0
    var next = Array(repeating: 0, count: s.count)

    for i in 1..<s.count {
        while j > 0 && s[i] != s[j] {
            j = next[j-1]
        }

        if s[i] == s[j] {
            j += 1
        }
        next[i] = j
    }
    return next
}
