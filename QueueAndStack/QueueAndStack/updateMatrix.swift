//
//  updateMatrix.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/239/conclusion/1388/

import Foundation

func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
    let rowCnt = matrix.count
    let colCnt = matrix[0].count

    var matrix = matrix
    var pixls = [(Int, Int)]()
    var flags = Array(repeating: Array(repeating: false, count: colCnt), count: rowCnt)

    for r in 0..<rowCnt {
        for c in 0..<colCnt {
            if matrix[r][c] == 0 {
                pixls.append((r, c))
            }
        }
    }

    var distance = 0
    while(!pixls.isEmpty) {
        pixls = update(&matrix, &flags, pixls, distance)
        distance += 1
    }

    return matrix
}

private func update(_ matrix: inout [[Int]], _ flags: inout [[Bool]], _ pixls: [(Int, Int)], _ distance: Int) -> [(Int, Int)] {
    let rowCnt = matrix.count
    let colCnt = matrix[0].count

    var newPixls = [(Int, Int)]()

    for (r, c) in pixls {
        if !flags[r][c] {
            flags[r][c] = true
        } else {
            continue
        }

        matrix[r][c] = distance

        addToNext(r, c+1, rowCnt, colCnt, &newPixls, flags)
        addToNext(r, c-1, rowCnt, colCnt, &newPixls, flags)
        addToNext(r-1, c, rowCnt, colCnt, &newPixls, flags)
        addToNext(r+1, c, rowCnt, colCnt, &newPixls, flags)
    }

    return newPixls
}

private func addToNext(_ r: Int, _ c: Int, _ rowCnt: Int, _ colCnt: Int, _ pixls: inout [(Int, Int)], _ flags: [[Bool]]) {
    if r < 0 || r >= rowCnt { return }
    if c < 0 || c >= colCnt { return }
    if flags[r][c] { return }

    pixls.append((r, c))
}
