//
//  0221.maximalSquare.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rowCnt = matrix.count
    guard rowCnt > 0 else { return 0 }
    let colCnt = matrix[0].count
    guard colCnt > 0 else { return 0 }

    var dp = Array(repeating: Array(repeating: 0, count: colCnt), count: rowCnt)

    var max = 0
    for r in 0..<matrix.count {
        for c in 0..<matrix[0].count {
            if r == 0 || c == 0 {
                dp[r][c] = convert(matrix[r][c])
            } else if matrix[r][c] == "0" {
                dp[r][c] = 0
            } else {
                dp[r][c] = min3(dp[r][c-1], dp[r-1][c-1], dp[r-1][c]) + 1
            }

            max = Swift.max(max, dp[r][c])
        }
    }

    return max * max
}

private func convert(_ ch: Character) -> Int {
    return Int(String(ch))!
}

private func min3(_ val1: Int, _ val2: Int, _ val3: Int) -> Int {
    return min(val1, min(val2, val3))
}
