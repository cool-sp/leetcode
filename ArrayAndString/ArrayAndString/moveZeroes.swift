//
//  moveZeroes.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/204/conclusion/1174/

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    if nums.count <= 1 { return }

    var i = -1
    var j = 0
    while(j < nums.count && i < 0) {
        if nums[j] == 0 { i = j }
        j += 1
    }

    if i < 0 { return }

    j = i + 1
    while(j < nums.count) {
        if nums[j] == 0 {
            j += 1
        } else {
            nums[i] = nums[j]
            i += 1
            j += 1
        }
    }

    while(i < nums.count) {
        nums[i] = 0
        i += 1
    }
}
