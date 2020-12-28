//
//  0097.isInterleave.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

// dp[i][j] = true means
// [0..<i] in s1 and [0..<j] in s2 are interleave with [0..<i+j] in s3
// dp[i][j] = OR(dp[i-1][j] && s1[i-1] == s3[i+j-1], dp[i][j-1] && s2[j-1] == s3[i+j-1])

func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    let lenOfS1 = s1.count
    let lenOfS2 = s2.count
    let lenOfS3 = s3.count

    guard lenOfS3 == lenOfS1 + lenOfS2 else { return false }
    let s1 = Array(s1)
    let s2 = Array(s2)
    let s3 = Array(s3)

    var dp = Array(repeating: Array(repeating: false, count: lenOfS2+1), count: lenOfS1+1)
    dp[0][0] = true

    for i in 0...lenOfS1 {
        for j in 0...lenOfS2 {
            if i == 0 && j == 0 {
                dp[i][j] = true
            } else if i == 0 {
                dp[i][j] = s2[j-1] == s3[j-1] && dp[i][j-1]
            } else if j == 0 {
                dp[i][j] = s1[i-1] == s3[i-1] && dp[i-1][j]
            } else {
                let res1 = s1[i-1] == s3[i+j-1] && dp[i-1][j]
                let res2 = s2[j-1] == s3[i+j-1] && dp[i][j-1]
                dp[i][j] = res1 || res2
            }
        }
    }

    return dp[lenOfS1][lenOfS2]
}
