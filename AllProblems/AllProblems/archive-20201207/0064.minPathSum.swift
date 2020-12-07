//
//  0064.minPathSum.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func minPathSum(_ grid: [[Int]]) -> Int {
    let rowCnt = grid.count
    guard rowCnt > 0 else { return 0 }
    let colCnt = grid[0].count
    guard colCnt > 0 else { return 0 }

    if rowCnt == 1 {
        return grid[0].reduce(0, +)
    }
    if colCnt == 1 {
        var sum = 0
        for r in 0..<rowCnt {
            sum += grid[r][0]
        }
        return sum
    }

    var dp = grid
    for r in stride(from: rowCnt-2, to: -1, by: -1) {
        dp[r][colCnt-1] += dp[r+1][colCnt-1]
    }
    for c in stride(from: colCnt-2, to: -1, by: -1) {
        dp[rowCnt-1][c] += dp[rowCnt-1][c+1]
    }

    for r in stride(from: rowCnt-2, to: -1, by: -1) {
        for c in stride(from: colCnt-2, to: -1, by: -1) {
            dp[r][c] = dp[r][c] + min(dp[r][c+1], dp[r+1][c])
        }
    }

    return dp[0][0]
}
