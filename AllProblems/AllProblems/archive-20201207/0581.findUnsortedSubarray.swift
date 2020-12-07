//
//  0581.findUnsortedSubarray.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func findUnsortedSubarray(_ nums: [Int]) -> Int {
    var min = Int.max
    var prev = Int.min
    for i in 0..<nums.count {
        if nums[i] < prev {
            min = Swift.min(min, nums[i])
        }
        prev = nums[i]
    }

    var max = Int.min
    prev = Int.max
    for j in stride(from: nums.count-1, to: -1, by: -1) {
        if nums[j] > prev {
            max = Swift.max(max, nums[j])
        }
        prev = nums[j]
    }

    var left = 0
    for i in 0..<nums.count {
        if nums[i] > min {
            left = i
            break
        }
    }

    var right = nums.count - 1
    for j in stride(from: nums.count-1, to: -1, by: -1) {
        if nums[j] < max {
            right = j
            break
        }
    }

    if min == Int.max {
        return 0
    }
    return right - left + 1
}
