//
//  removeElement.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/205/array-two-pointer-technique/1151/

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var p1 = 0
    var p2 = 0
    while(p2 < nums.count) {
        if nums[p2] == val {
            p2 += 1
        } else {
            nums[p1] = nums[p2]
            p1 += 1
            p2 += 1
        }
    }

    return p1
}
