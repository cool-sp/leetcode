//
//  0005.longestPalindrome.swift
//  AllProblems
//
//  Created by liuning on 2020/11/18.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 { return s }

    let s = Array(s)
    var longest = 0
    var longestMid = 0
    for idx in 0..<s.count {
        let len1 = expandCheck(s, idx, idx)
        let len2 = expandCheck(s, idx, idx+1)

        if max(len1, len2) > longest {
            longest = max(len1, len2)
            longestMid = idx
        }
    }

    let startPos = longestMid - (longest - 1)/2
    return String(s[startPos..<startPos+longest])
}

private func expandCheck(_ s: [Character], _ left: Int, _ right: Int) -> Int {
    if left > right { return 0 }
    if left < 0 || right >= s.count { return 0 }
    if left == right - 1 && s[left] != s[right] { return 0 }

    var left = left
    var right = right
    while(left >= 0 && right < s.count && s[left] == s[right]) {
        left -= 1
        right += 1
    }
    return right - left - 1
}
