//
//  0395.longestSubstring.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

func longestSubstring(_ s: String, _ k: Int) -> Int {
    guard s.count > 0 else { return 0 }
    guard s.count >= k else { return 0}

    let s = Array(s)
    return longest(s, 0, s.count-1, k)
}

private func longest(_ s: [Character], _ from: Int, _ to: Int, _ k: Int) -> Int {
    if to - from + 1 < k { return 0 }
    if from > to { return 0 }

    var freq = [Character: Int]()
    for i in from...to {
        freq[s[i], default:0] += 1
    }

    let blacklist = freq.filter{ $0.value < k }.keys
    if blacklist.count <= 0 { return to - from + 1 }

    var idxArr = [Int]()
    idxArr.append(from - 1)
    for idx in from...to where blacklist.contains(s[idx]) {
        idxArr.append(idx)
    }
    idxArr.append(to + 1)

    var max = 0
    for i in 1..<idxArr.count {
        max = Swift.max(max, longest(s, idxArr[i-1]+1, idxArr[i]-1, k))
    }

    return max
}
