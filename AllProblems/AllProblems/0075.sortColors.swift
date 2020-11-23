//
//  0075.sortColors.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func sortColors(_ nums: inout [Int]) {
    var counter = Array(repeating: 0, count: 3)

    for num in nums {
        counter[num] += 1
    }

    for i in 0..<counter[0] {
        nums[i] = 0
    }
    for j in counter[0]..<counter[0]+counter[1] {
        nums[j] = 1
    }
    for k in counter[0]+counter[1]..<counter[0]+counter[1]+counter[2] {
        nums[k] = 2
    }
}
