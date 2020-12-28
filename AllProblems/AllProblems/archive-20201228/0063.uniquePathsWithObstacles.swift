//
//  0063.uniquePathsWithObstacles.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let rowCnt = obstacleGrid.count
    guard rowCnt > 0 else { return 0 }
    let colCnt = obstacleGrid[0].count
    guard colCnt > 0 else { return 0 }

    var dp = Array(repeating: Array(repeating: 0, count: colCnt), count: rowCnt)
    dp[0][0] = 1

    for r in 0..<rowCnt {
        for c in 0..<colCnt {
            if obstacleGrid[r][c] == 1 {
                dp[r][c] = 0
                continue
            }

            if r == 0 && c == 0 { continue }
            let left = c - 1 < 0 ? 0 : dp[r][c-1]
            let top = r - 1 < 0 ? 0 : dp[r-1][c]
            dp[r][c] = left + top
        }
    }

    return dp[rowCnt-1][colCnt-1]
}
