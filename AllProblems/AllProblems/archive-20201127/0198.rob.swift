//
//  0198.rob.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    // dp[i] = max(dp[i-2] + nums[i-1], dp[i-1])
    // dp[0] = 0
    // dp[1] = nums[0]

    if nums.count <= 0 { return 0 }
    if nums.count == 1 { return nums[0] }

    var dp = Array(repeating: 0, count: nums.count+1)
    dp[0] = 0
    dp[1] = nums[0]

    for i in 2...nums.count {
        dp[i] = max(dp[i-2] + nums[i-1], dp[i-1])
    }

    return dp[nums.count]
}
