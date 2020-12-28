//
//  0028.strStr.swift
//  AllProblems
//
//  Created by liuning on 2020/12/28.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle.count > 0 else { return 0 }
    guard haystack.count > 0 else { return -1 }

    let res = kmpSearch(haystack, needle)
    if res.count > 0 { return res[0] }
    else { return -1 }
}

private func kmpSearch(_ s: String, _ p: String) -> [Int] {
    guard s.count > 0 else { return [] }
    guard p.count > 0 else { return [] }
    guard p.count <= s.count else { return [] }

    let s = Array(s)
    let p = Array(p)
    let next = buildNextTable(p)
    var res = [Int]()

    var j = 0
    for i in 0..<s.count {
        while j > 0 && s[i] != p[j] {
            j = next[j]
        }

        if s[i] == p[j] {
            j += 1
        }

        if j == p.count {
            res.append(i + 1 - p.count)
            j = next[j]
        }
    }

    return res
}

private func buildNextTable(_ s: [Character]) -> [Int] {
    guard s.count > 0 else { return [] }

    var next = [0, 0]
    var j = 0

    for i in 1..<s.count {
        while j > 0 && s[j] != s[i] {
            j = next[j]
        }

        if s[i] == s[j] {
            j += 1
        }
        next.append(j)
    }
    return next
}
