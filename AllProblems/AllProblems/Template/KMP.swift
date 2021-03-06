//
//  KMP.swift
//  AllProblems
//
//  Created by liuning on 2020/12/28.
//

import Foundation

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

private func buildNextTable(_ p: [Character]) -> [Int] {
    guard p.count > 0 else { return [] }

    var next = [0, 0]
    var j = 0

    for i in 1..<p.count {
        while j > 0 && p[j] != p[i] {
            j = next[j]
        }

        if p[i] == p[j] {
            j += 1
        }
        next.append(j)
    }
    return next
}
