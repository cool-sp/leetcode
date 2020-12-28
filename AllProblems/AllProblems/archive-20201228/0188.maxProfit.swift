//
//  0188.maxProfit.swift
//  AllProblems
//
//  Created by liuning on 2020/12/27.
//

import Foundation

func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    // dp[i][j][k]
    // i:  0 <= i < prices.count
    // j:  0: no stock, 1: has stock
    // k:  complete k transacations
    // dp[0][0][0]:     0
    // dp[0][0][1...k]: Int.min
    // dp[0][1][0]:     Int.min
    // dp[0][1][1]:     -prices[0]
    // dp[0][1][2...k]: Int.min

    // dp[i][0][k]
    //   = max(dp[i-1][1][k] + prices[i], dp[i-1][0][k])
    // dp[i][1][k]
    //   = max(dp[i-1][0][k-1] - prices[i], dp[i-1][1][k])

    guard k > 0 else { return 0 }
    guard prices.count > 0 else { return 0 }
    var dp = Array(repeating: Array(repeating: Array(repeating: Int.min, count: k+1), count: 2), count: prices.count)

    dp[0][0][0] = 0
    dp[0][1][1] = -prices[0]

    for i in 1..<prices.count {
        for j in 0...1 {
            for p in 0...k {
                if j == 0 {
                    dp[i][j][p] = max(calculate(dp, i-1, 1, p, prices[i]), dp[i-1][0][p])
                } else {
                    dp[i][j][p] = max(calculate(dp, i-1, 0, p-1, -prices[i]), dp[i-1][1][p])
                }
            }
        }
    }

    var res = 0
    for p in 0...k {
        res = max(dp[prices.count-1][0][p], res)
    }

    return res
}

private func calculate(_ dp: [[[Int]]], _ i: Int, _ j: Int, _ p: Int, _ val: Int) -> Int {
    guard i >= 0 else { return Int.min }
    guard j >= 0 else { return Int.min }
    guard p >= 0 else { return Int.min }
    guard dp[i][j][p] != Int.min else { return Int.min }

    return dp[i][j][p] + val
}
