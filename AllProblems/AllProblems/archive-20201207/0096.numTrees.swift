//
//  0096.numTrees.swift
//  AllProblems
//
//  Created by liuning on 2020/12/6.
//

import Foundation

func numTrees(_ n: Int) -> Int {
    // dp[i]: the number of i nodes, how many binary search tree
    // for dp[n]:
    // dp[0...k...n]
    // dp[n] = dp[0]*dp[n-1] + dp[1]*dp[n-2] + ... + dp[n-2]dp[1] + dp[n-1]*dp[0]

    if n < 1 { return 0 }
    if n < 2 { return 1 }

    var dp = Array(repeating: 0, count: n+1)
    dp[0] = 1
    dp[1] = 1

    for i in 2...n {
        for j in 0...i-1 {
            dp[i] += dp[j]*dp[i-j-1]
        }
    }

    return dp[n]
}
