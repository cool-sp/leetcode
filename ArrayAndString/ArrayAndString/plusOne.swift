//
//  plusOne.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/201/introduction-to-array/1148/

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    var idx = digits.count - 1
    var carryover = 1

    while(idx >= 0) {
        if digits[idx] + carryover >= 10 {
            digits[idx] = digits[idx] + carryover - 10
            carryover = 1
        } else {
            digits[idx] += carryover
            carryover = 0
        }

        idx -= 1
    }

    if carryover == 1 {
        digits.insert(1, at: 0)
    }

    return digits
}
