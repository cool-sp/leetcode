//
//  0329.longestIncreasingPath.swift
//  AllProblems
//
//  Created by liuning on 2020/12/2.
//

import Foundation

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    guard matrix.count > 0 else { return 0 }
    guard matrix[0].count > 0 else { return 0 }

    var memory = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    var maxVal = 0
    for r in 0..<matrix.count {
        for c in 0..<matrix[0].count {
            maxVal = max(maxVal, travel(matrix, r, c, &memory))
        }
    }

    return maxVal
}

private func travel(_ matrix: [[Int]], _ r: Int, _ c: Int, _ memory: inout [[Int]]) -> Int {
    if memory[r][c] > 0 { return memory[r][c] }

    var maxVal = 0
    let offsets = [[-1, 0], [0, -1], [1, 0], [0, 1]]
    for offset in offsets {
        let newR = r + offset[0]
        let newC = c + offset[1]

        if newR >= 0 && newR < matrix.count
            && newC >= 0 && newC < matrix[0].count
            && matrix[r][c] < matrix[newR][newC] {

            maxVal = max(maxVal, travel(matrix, newR, newC, &memory))
        }
    }
    memory[r][c] = maxVal + 1
    return memory[r][c]
}
