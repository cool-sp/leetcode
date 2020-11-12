//
//  isPerfectSquare.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/137/conclusion/978/

import Foundation

func isPerfectSquare(_ num: Int) -> Bool {
    if num == 1 { return true }
    if num == 4 { return true }
    if num == 9 { return true }
    if num == 16 { return true }
    if num < 16 { return false }

    var left = 4
    var right = num/2

    while(left <= right) {
        let mid = left + (right-left)/2
        let mul = mid*mid
        if mul == num {
            return true
        } else if mul > num {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return false
}
