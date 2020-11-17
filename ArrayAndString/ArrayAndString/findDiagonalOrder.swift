//
//  findDiagonalOrder.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/202/introduction-to-2d-array/1167/

import Foundation

func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count > 0 else { return [] }
    guard matrix[0].count > 0 else { return [] }

    let maxR = matrix.count
    let maxC = matrix[0].count

    var result = [Int]()
    result.append(matrix[0][0])

    var r = 0
    var c = 0
    var up = true
    while(next(&r, &c, &up, maxR, maxC)) {
        result.append(matrix[r][c])
    }

    return result
}

private func next(_ r: inout Int, _ c: inout Int, _ up: inout Bool, _ maxR: Int, _ maxC: Int) -> Bool {
    if up {
        if r - 1 >= 0 && c + 1 < maxC {
            r = r - 1
            c = c + 1
        } else if c + 1 < maxC {
            c = c + 1
            up = false
        } else {
            r = r + 1
            up = false
        }
    } else {
        if r + 1 < maxR && c - 1 >= 0 {
            r = r + 1
            c = c - 1
        } else if r + 1 < maxR {
            r = r + 1
            up = true
        } else {
            c = c + 1
            up = true
        }
    }

    return r >= 0 && r < maxR && c >= 0 && c < maxC
}
