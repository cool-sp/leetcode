//
//  reverseString.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/205/array-two-pointer-technique/1183/

import Foundation

func reverseString(_ s: inout [Character]) {
    if s.count <= 1 { return }

    var L = 0
    var R = s.count - 1
    while (L <= R) {
        let temp = s[L]
        s[L] = s[R]
        s[R] = temp

        L += 1
        R -= 1
    }
}
