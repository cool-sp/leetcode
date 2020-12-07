//
//  0072.minDistance.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func minDistance(_ word1: String, _ word2: String) -> Int {
    // define dp[i][j] as the 'edit distance' between word1[0..<i] and word2[0..<j]
    // then we have:
    // if word1[i-1] == word2[j-1]:
    //     dp[i][j] = min(dp[i][j-1]+1, dp[i-1][j]+1, dp[i-1][j-1])
    // if word1[i-1] != word2[j-1]:
    //     dp[i][j] = min(dp[i][j-1]+1, dp[i-1][j]+1, dp[i-1][j-1]+1)

    let word1 = Array(word1)
    let word2 = Array(word2)

    if word1.isEmpty { return word2.count }
    if word2.isEmpty { return word1.count }

    let rowCnt = word1.count
    let colCnt = word2.count

    var dp = Array(repeating: Array(repeating: 0, count: colCnt+1), count: rowCnt+1)

    for r in 0...rowCnt {
        for c in 0...colCnt {
            if r == 0 {
                dp[r][c] = c
            } else if c == 0 {
                dp[r][c] = r
            } else if word1[r-1] == word2[c-1] {
                dp[r][c] = min3(dp[r][c-1] + 1, dp[r-1][c] + 1, dp[r-1][c-1])
            } else {
                dp[r][c] = min3(dp[r][c-1] + 1, dp[r-1][c] + 1, dp[r-1][c-1] + 1)
            }
        }
    }

    return dp[rowCnt][colCnt]
}

private func min3(_ val1: Int, _ val2: Int, _ val3: Int) -> Int {
    return min(val1, min(val2, val3))
}
