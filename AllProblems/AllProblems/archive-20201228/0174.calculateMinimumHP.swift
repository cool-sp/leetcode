//
//  0174.calculateMinimumHP.swift
//  AllProblems
//
//  Created by liuning on 2020/12/25.
//

import Foundation

func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
    let rowCnt = dungeon.count
    guard rowCnt > 0 else { return -1 }
    let colCnt = dungeon[0].count
    guard colCnt > 0 else { return -1 }

    var dp = Array(repeating: Array(repeating: 0, count: colCnt), count: rowCnt)

    for r in stride(from: rowCnt-1, to: -1, by: -1) {
        for c in stride(from: colCnt-1, to: -1, by: -1) {
            if r == rowCnt-1 && c == colCnt-1 {
                dp[r][c] = max(1, 1-dungeon[r][c])
            } else if r == rowCnt-1 {
                dp[r][c] = max(1, dp[r][c+1]-dungeon[r][c])
            } else if c == colCnt-1 {
                dp[r][c] = max(1, dp[r+1][c]-dungeon[r][c])
            } else {
                dp[r][c] = max(1, min(dp[r+1][c],dp[r][c+1])-dungeon[r][c])
            }
         }
    }

    return dp[0][0]
}
