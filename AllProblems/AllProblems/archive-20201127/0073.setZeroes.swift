//
//  0073.setZeroes.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    var row = [Int]()
    var column = [Int]()

    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] == 0 {
                row.append(i)
                column.append(j)
            }
        }
    }

    for r in row {
        for j in 0..<matrix[0].count {
            matrix[r][j] = 0
        }
    }

    for i in 0..<matrix.count {
        for c in column {
            matrix[i][c] = 0
        }
    }
}
