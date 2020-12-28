//
//  0045.jump.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func jump(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else { return 0 }

    var currEnd = nums[0]
    var nextEnd = Int.min
    var steps = 0

    var i = 1
    while currEnd < nums.count - 1 {
        nextEnd = max(nextEnd, nums[i] + i)
        if i == currEnd {
            currEnd = nextEnd
            steps += 1
        }
        i += 1
    }

    steps += 1
    return steps
}

//func jump(_ nums: [Int]) -> Int {
//    guard nums.count > 0 else { return 0 }
//
//    var dp = Array(repeating: -1, count: nums.count)
//    dp[0] = 0
//
//    for i in 1..<nums.count {
//        var minVal = Int.max
//        for j in 0..<i where dp[j] >= 0 {
//            if j + nums[j] >= i {
//                minVal = min(minVal, dp[j])
//            }
//        }
//
//        dp[i] = minVal + 1
//    }
//
//    return dp[nums.count-1]
//}
