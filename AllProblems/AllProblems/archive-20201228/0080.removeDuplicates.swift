//
//  0080.removeDuplicates.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else { return 0 }

    var i = 1
    var j = 1
    var k = 1
    var prev = nums[0]
    while j < nums.count {
        if nums[j] == prev {
            k += 1
        } else {
            k = 1 // reset
        }

        if k <= 2 {
            nums[i] = nums[j]
            i += 1
        }

        prev = nums[j]
        j += 1
    }

    return i
}
