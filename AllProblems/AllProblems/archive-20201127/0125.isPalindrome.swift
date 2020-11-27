//
//  0125.isPalindrome.swift
//  AllProblems
//
//  Created by liuning on 2020/11/22.
//

import Foundation

func isPalindrome(_ s: String) -> Bool {
    let s = Array(s)
    var left = 0
    var right = s.count - 1

    while(left <= right) {
        if canIgnore(s[left]) { left += 1; continue }
        if canIgnore(s[right]) { right -= 1; continue }

        let leftChar = s[left].lowercased()
        let rightChar = s[right].lowercased()
        if (leftChar == rightChar) {
            left += 1
            right -= 1
        } else {
            break
        }
    }

    return left > right
}

private func canIgnore(_ ch: Character) -> Bool {
    return !(ch.isNumber || ch.isLetter)
}
