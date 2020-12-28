//
//  0123.maxProfit.swift
//  AllProblems
//
//  Created by liuning on 2020/12/21.
//

import Foundation

// dp[i][j][k]
// i: ith day
// j: has stock, 0: no, 1: yes
// k: sold times, 0 - 2
func maxProfit123(_ prices: [Int]) -> Int {
    guard prices.count >= 1 else { return 0 }
    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 2), count: prices.count)

    dp[0][0][0] = 0
    dp[0][0][1] = Int.min
    dp[0][0][2] = Int.min
    dp[0][1][0] = -prices[0]
    dp[0][1][1] = Int.min
    dp[0][1][2] = Int.min

    for i in 1..<prices.count {
        dp[i][0][0] = 0
        dp[i][0][1] = max(calcHelper(dp[i-1][1][0], prices[i]), dp[i-1][0][1])
        dp[i][0][2] = max(calcHelper(dp[i-1][1][1], prices[i]), dp[i-1][0][2])
        dp[i][1][0] = max(calcHelper(dp[i-1][0][0], -prices[i]), dp[i-1][1][0])
        dp[i][1][1] = max(calcHelper(dp[i-1][0][1], -prices[i]), dp[i-1][1][1])
        dp[i][1][2] = Int.min
    }

    return max(dp[prices.count-1][0][0], dp[prices.count-1][0][1], dp[prices.count-1][0][2])
}

// protect overflow
private func calcHelper(_ val: Int, _ extra: Int) -> Int {
    if val == Int.min { return Int.min }
    else { return val + extra }
}
