//
//  0120.minimumTotal.swift
//  AllProblems
//
//  Created by liuning on 2020/12/14.
//

import Foundation

// dp[i][j] = min(dp[i-1][j-1], dp[i-1][j]) + c[i][j]
func minimumTotal(_ triangle: [[Int]]) -> Int {
    let N = triangle.count
    guard N > 0 else { return 0 }

    var dp = Array(repeating: Array(repeating: 0, count: N), count: N)
    var minVal = Int.max

    for i in 0..<N {
        for j in 0...i {
            if i == 0 {
                dp[i][j] = triangle[i][j]
            } else if j-1 < 0 {
                dp[i][j] = dp[i-1][j] + triangle[i][j]
            } else if j == i {
                dp[i][j] = dp[i-1][j-1] + triangle[i][j]
            } else {
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j]
            }

            minVal = min(minVal, dp[i][j])
        }
    }

    return dp[N-1].min()!
}
