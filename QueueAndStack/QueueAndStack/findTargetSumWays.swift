//
//  findTargetSumWays.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/232/practical-application-stack/1389/

import Foundation

func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    guard nums.count > 0 else { return 0 }
    guard S <= 1000 else { return 0 }

    var DP = Array(repeating: 0, count: 2002)
    DP[1000 + nums[0]] += 1
    DP[1000 - nums[0]] += 1

    for idx in 1..<nums.count {
        var nextDP = Array(repeating: 0, count: 2002)
        for (idx2, item) in DP.enumerated() {
            if item > 0 {
                nextDP[1000 + (idx2 - 1000) + nums[idx]] += DP[idx2]
                nextDP[1000 + (idx2 - 1000) - nums[idx]] += DP[idx2]
            }
        }
        DP = nextDP
    }

    return DP[1000+S]
}
