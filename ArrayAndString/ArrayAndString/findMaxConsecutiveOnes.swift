//
//  findMaxConsecutiveOnes.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/205/array-two-pointer-technique/1301/

import Foundation

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var maxCount = 0
    var count = 0

    for num in nums {
        if num == 0 {
            count = 0
        } else {
            count += 1
            if count > maxCount { maxCount = count }
        }
    }

    return maxCount
}
