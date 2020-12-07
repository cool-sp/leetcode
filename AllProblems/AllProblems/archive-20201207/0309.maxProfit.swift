//
//  0309.maxProfit.swift
//  AllProblems
//
//  Created by liuning on 2020/12/6.
//

import Foundation

func maxProfit309(_ prices: [Int]) -> Int {
    // define dp[x][j] as the max profit at ith day:
    // ...
    // dp[0][i]: at end of ith day, no stock (just sell stock)
    // dp[1][i]: at end of ith day, no stock (frozen)
    // dp[2][i]: at end of ith day, no stack (free to buy)
    // dp[3][i]: at end of ith day, has stock
    // ...
    // dp[0][i] = dp[3][i-1] + prices[i]
    // dp[1][i] = dp[0][i-1]
    // dp[2][i] = max(dp[1][i-1], dp[2][i-1])
    // dp[3][i] = max(dp[3][i-1], dp[1][i-1] - prices[i], dp[2][i-1] - prices[i])

    guard prices.count > 0 else { return 0 }

    var dp = Array(repeating: Array(repeating: 0, count: prices.count), count: 4)
    dp[0][0] = 0
    dp[1][0] = 0
    dp[2][0] = 0
    dp[3][0] = -prices[0]

    for i in 1..<prices.count {
        dp[0][i] = dp[3][i-1] + prices[i]
        dp[1][i] = dp[0][i-1]
        dp[2][i] = max(dp[1][i-1], dp[2][i-1])
        dp[3][i] = max3(dp[3][i-1], dp[1][i-1] - prices[i], dp[2][i-1] - prices[i])
    }

    let N = prices.count - 1
    let ret = max(dp[0][N], dp[1][N], dp[2][N])
    return ret
}

private func max3(_ val1: Int, _ val2: Int, _ val3: Int) -> Int {
    return max(val1, max(val2, val3))
}
