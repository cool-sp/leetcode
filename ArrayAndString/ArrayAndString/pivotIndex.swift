//
//  pivotIndex.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/201/introduction-to-array/1144/

import Foundation

func pivotIndex(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return -1 }
    let sum = nums.reduce(0, +)

    var i = 0
    var sumL = nums[0]
    var sumR = sum - sumL + nums[0]

    while(i <= nums.count - 2) {
        if sumL != sumR {
            sumL = sumL + nums[i+1]
            sumR = sum - sumL + nums[i+1]
            i += 1
        } else {
            return i
        }
    }

    if sumL == nums[i] { return i } // last element
    else { return -1 }
}
