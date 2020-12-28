//
//  0074.searchMatrix.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let rowCnt = matrix.count
    guard rowCnt > 0 else { return false }
    let colCnt = matrix[0].count
    guard colCnt > 0 else { return false }

    var r = rowCnt - 1
    var c = 0

    while r >= 0 && c < colCnt {
        if matrix[r][c] == target {
            return true
        } else if matrix[r][c] > target {
            r -= 1
        } else {
            c += 1
        }
    }

    return false
}
