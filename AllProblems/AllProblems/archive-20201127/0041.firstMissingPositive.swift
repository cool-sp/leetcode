//
//  0041.firstMissingPositive.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func firstMissingPositive(_ nums: [Int]) -> Int {
    let n = nums.count
    var nums = nums

    for idx in 0..<n {
        if nums[idx] <= 0 {
            nums[idx] = n + 1
        }
    }

    for idx in 0..<n {
        let num = abs(nums[idx])
        if num <= n {
            nums[num-1] = -abs(nums[num-1])
        }
    }

    for idx in 0..<n {
        if nums[idx] > 0 {
            return idx + 1
        }
    }

    return n + 1
}
