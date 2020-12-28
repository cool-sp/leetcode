//
//  0115.numDistinct.swift
//  AllProblems
//
//  Created by liuning on 2020/12/14.
//

import Foundation

// dp[i][j] stands for the result of [0..<i] in s1 and [0..<j] for s2
// dp[i][j] =
//     dp[i-1][j-1] + dp[i-1][j] (if s[i-1] == t[j-1])
//     dp[i-1][j]                (if s[i-1] != t[j-1])
func numDistinct(_ s: String, _ t: String) -> Int {
    guard s.count >= t.count else { return 0 }
    
    let s = Array(s)
    let t = Array(t)

    var dp = Array(repeating: Array(repeating: 0, count: t.count+1), count: s.count+1)

    for i in 1...s.count {
        for j in 1...t.count {
            if j == 1 {
                dp[i][j] = dp[i-1][j] + (s[i-1] == t[j-1] ? 1 : 0)
                continue
            }

            if s[i-1] == t[j-1] {
                dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }

    return dp[s.count][t.count]
}
