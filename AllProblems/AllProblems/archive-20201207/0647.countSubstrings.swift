//
//  0647.countSubstrings.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func countSubstrings(_ s: String) -> Int {
    // define dp[i][j] is s[i...j] is palindrome
    // dp[i][j] = (s[i] == s[j]) && (j-i<3 or dp[i+1][j-1])
    // where dp[i][i] is always true

    let s = Array(s)
    guard s.count > 0 else { return 0 }

    var countStr = 0
    var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
    for j in 0..<s.count {
        for i in 0...j {
            if s[i] != s[j] {
                dp[i][j] = 0
            } else if j - i < 3 {
                dp[i][j] = 1
            } else {
                dp[i][j] = dp[i+1][j-1]
            }

            countStr += dp[i][j]
        }
    }

    return countStr
}
