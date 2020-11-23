//
//  0048.rotate.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    guard matrix.count > 0 else { return }
    guard matrix[0].count > 0 else { return }
    guard matrix.count == matrix[0].count else { return }

    let cnt = matrix.count/2
    var r = 0
    while(r < cnt) {
        rotateCycle(&matrix, r)
        r += 1
    }
}

private func rotateCycle(_ matrix: inout [[Int]], _ r: Int) {
    let N = matrix.count
    for idx in r..<N-r-1 {
        // v1 -> v2
        // v2 -> v3
        // v3 -> v4
        // v4 -> v1
        let v1 = matrix[r][idx]
        let v2 = matrix[idx][N-1-r]
        let v3 = matrix[N-1-r][N-1-idx]
        let v4 = matrix[N-1-idx][r]

        matrix[idx][N-1-r] = v1
        matrix[N-1-r][N-1-idx] = v2
        matrix[N-1-idx][r] = v3
        matrix[r][idx] = v4
    }
}
