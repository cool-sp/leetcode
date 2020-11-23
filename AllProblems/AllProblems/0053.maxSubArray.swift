//
//  0053.maxSubArray.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return 0 }

    var maxSum = Int.min
    var sum = 0
    for num in nums {
        sum += num

        if sum > maxSum {
            maxSum = sum
        }

        if sum < 0 {
            sum = 0
        }
    }

    return maxSum
}
