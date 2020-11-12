//
//  firstBadVersion.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/126/template-ii/947/

import Foundation

func isBadVersion(_ version: Int) -> Bool {
    return true
}

func firstBadVersion(_ n: Int) -> Int {
    var left = 1
    var right = n

    while(left <= right) {
        let mid = left + (right-left)/2
        if isBadVersion(mid) {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return left
}
