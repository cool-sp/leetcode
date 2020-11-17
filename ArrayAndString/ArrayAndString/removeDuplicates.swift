//
//  removeDuplicates.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/204/conclusion/1173/

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 { return nums.count }

    var i = 0
    var j = 0
    while(j < nums.count) {
        if nums[i] == nums[j] {
            j += 1
        } else {
            nums[i+1] = nums[j]
            i += 1
            j += 1
        }
    }

    return i + 1
}
