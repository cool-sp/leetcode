//
//  0087.isScramble.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

// define dp[len][i][j] as
// string s1[i..<i+len] is scramble with s2[j..<i+len]
// then for each value between [1...len-1], marked as "w"
// dp[len][i][j] =
//   OR (dp[w][i][j] && dp[len-w][i+w][j+w])
//   OR (dp[w][i][j+len-w] && dp[len-w][i+w][j])
// furthurmore, dp[1][i][j] == true if s1[i] == s2[j]

func isScramble(_ s1: String, _ s2: String) -> Bool {
    let s1 = Array(s1)
    let s2 = Array(s2)

    guard s1.count == s2.count else { return false }
    let N = s1.count

    var dp = Array(repeating: Array(repeating: Array(repeating: false, count: N), count: N), count: N+1)

    for i in 0..<N {
        for j in 0..<N {
            if s1[i] == s2[j] {
                dp[1][i][j] = true
            }
        }
    }

    if N <= 1 { return dp[N][0][0] }

    for len in 2...N {
        for i in 0..<N-len+1 {
            for j in 0..<N-len+1 {
                var res = false
                for w in 1...len-1 {
                    res = res || (dp[w][i][j] && dp[len-w][i+w][j+w])
                    if res { break }
                    res = res || (dp[w][i][j+len-w] && dp[len-w][i+w][j])
                }
                dp[len][i][j] = res
            }
        }
    }

    return dp[N][0][0]
}
