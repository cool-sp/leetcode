//
//  0338.countBits.swift
//  AllProblems
//
//  Created by liuning on 2020/12/6.
//

import Foundation

func countBits(_ num: Int) -> [Int] {
    if num <= 0 { return [0] }

    var dp = Array(repeating: 0, count: num+1)
    for i in 1...num {
        dp[i] = dp[i&(i-1)] + 1
    }

    return dp
}
