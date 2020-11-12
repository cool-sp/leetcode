//
//  mySqrt.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/125/template-i/950/

import Foundation

func mySqrt(_ x: Int) -> Int {
    if x <= 0 { return 0 }
    if x <= 2 { return 1 }

    var left = 1
    var right = x/2
    var mid = 0
    var result = 0
    while(left <= right) {
        mid = left + (right-left)/2
        if mid*mid == x {
            return mid
        } else if mid*mid > x {
            right =  mid - 1
        } else {
            left = mid + 1
            result = mid
        }
    }

    return result
}
