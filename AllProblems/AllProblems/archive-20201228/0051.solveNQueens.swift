//
//  0051.solveNQueens.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func solveNQueens(_ n: Int) -> [[String]] {
    guard n > 0 else { return [] }

    let matrix = Array(repeating: 0, count: n)
    var res = [[String]]()
    backtrace(matrix, 0, Set<Int>(), Set<Int>(), Set<Int>(), &res)

    return res
}

private func backtrace(_ matrix: [Int],
                       _ r: Int,
                       _ col: Set<Int>,
                       _ slopLeft: Set<Int>,
                       _ slopRight: Set<Int>,
                       _ res: inout [[String]]) {

    if r == matrix.count {
        res.append(toMatrixString(matrix))
    }

    for c in 0..<matrix.count {
        if col.contains(c) { continue }
        if slopLeft.contains(r-c) { continue }
        if slopRight.contains(r+c) { continue }

        var newMatrix = matrix
        var newCol = col
        var newSlopLeft = slopLeft
        var newSlopRight = slopRight
        newCol.insert(c)
        newSlopLeft.insert(r-c)
        newSlopRight.insert(r+c)
        newMatrix[r] = c

        backtrace(newMatrix, r+1, newCol, newSlopLeft, newSlopRight, &res)
    }
}

private func toMatrixString(_ matrix: [Int]) -> [String] {
    var arr = [[Character]](repeating: [Character](repeating: ".", count: matrix.count), count: matrix.count)
    for (r, c) in matrix.enumerated() {
        arr[r][c] = "Q"
    }
    return arr.map { String($0) }
}
