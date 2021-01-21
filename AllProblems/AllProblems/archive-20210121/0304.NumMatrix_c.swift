//
//  0304.NumMatrix.swift
//  AllProblems
//
//  Created by liuning on 2021/1/3.
//

import Foundation

class NumMatrix {
    var dp = [[Int]]()

    init(_ matrix: [[Int]]) {
        let rowCnt = matrix.count
        guard rowCnt > 0 else { return }
        let colCnt = matrix[0].count
        guard colCnt > 0 else { return }

        dp = Array(repeating: Array(repeating: 0, count: colCnt+1), count: rowCnt+1)

        for r in 0..<rowCnt {
            for c in 0..<colCnt {
                dp[r+1][c+1] = dp[r][c+1] + dp[r+1][c] - dp[r][c] + matrix[r][c]
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let upLeft = dp[row1][col1]
        let upRight = dp[row1][col2+1]
        let downLeft = dp[row2+1][col1]
        let downRight = dp[row2+1][col2+1]

        return downRight - upRight - downLeft + upLeft
    }
}
