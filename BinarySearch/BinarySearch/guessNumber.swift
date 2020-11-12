//
//  guessNumber.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/125/template-i/951/

import Foundation

func guess(_ num: Int) -> Int {
    return 0
}

func guessNumber(_ n: Int) -> Int {
    var left = 1
    var right = n

    while(left <= right) {
        let mid = left + (right-left)/2
        if guess(mid) == 0 {
            return mid
        } else if guess(mid) < 0 {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return -1
}
