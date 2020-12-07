//
//  0322.coinChange.swift
//  AllProblems
//
//  Created by liuning on 2020/12/1.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else { return 0 }
    guard coins.count > 0 else { return -1 }

    let minCoin = coins.min()!
    guard minCoin <= amount else { return -1 }

    var dp = Array(repeating: 0, count: amount+1)
    for coin in coins where coin <= amount {
        dp[coin] = 1
    }

    for i in 1...amount {
        var min = Int.max
        for coin in coins {
            if i-coin >= 0 && dp[i-coin] > 0 && dp[i-coin] < min {
                min = dp[i-coin]
            }
        }
        if min != Int.max {
            if dp[i] > 0  {
                dp[i] = Swift.min(dp[i], min + 1)
            } else {
                dp[i] = min + 1
            }
        }
    }

    return dp[amount] == 0 ? -1 : dp[amount]
}
