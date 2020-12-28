//
//  0213.rob.swift
//  AllProblems
//
//  Created by liuning on 2020/12/27.
//

import Foundation

func rob213(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    if nums.count == 1 { return nums[0] }

    // dp[0][j]: rob array, but no nob on the first
    // dp[1][j]: rob array, but rob on the first
    var dp = Array(repeating: Array(repeating: Int.min, count: nums.count), count: 2)
    dp[0][0] = 0
    dp[0][1] = nums[1]
    dp[1][0] = nums[0]
    dp[1][1] = nums[0]

    for i in 0...1 {
        var j = 2
        while j < nums.count {
            if j == nums.count-1 && i == 1 {
                dp[i][j] = dp[i][j-1]
            } else {
                dp[i][j] = max(dp[i][j-1], dp[i][j-2] + nums[j])
            }
            j += 1
        }
    }

    return max(dp[0][nums.count-1], dp[1][nums.count-1])
}
