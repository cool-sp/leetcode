//
//  spiralOrder.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/202/introduction-to-2d-array/1168/

import Foundation

enum Direction {
    case UP, DOWN, LEFT, RIGHT
}

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count > 0 else { return [] }
    guard matrix[0].count > 0 else { return [] }

    var minL = -1
    var maxR = matrix[0].count
    var minU = 0
    var maxD = matrix.count

    var result = [Int]()
    result.append(matrix[0][0])
    var r = 0
    var c = 0
    var direction = Direction.RIGHT
    while(next(&r, &c, &direction, &minL, &maxR, &minU, &maxD)) {
        result.append(matrix[r][c])
    }

    return result
}

private func next(_ r: inout Int,
                  _ c: inout Int,
                  _ direction: inout Direction,
                  _ minL: inout Int,
                  _ maxR: inout Int,
                  _ minU: inout Int,
                  _ maxD: inout Int) -> Bool {

    switch direction {
    case .UP:
        if r - 1 > minU {
            r = r - 1
        } else {
            minU = r
            if c + 1 < maxR {
                c = c + 1
                direction = .RIGHT
            } else {
                return false
            }
        }
    case .DOWN:
        if r + 1 < maxD {
            r = r + 1
        } else {
            maxD = r
            if c - 1 > minL {
                c = c - 1
                direction = .LEFT
            } else {
                return false
            }
        }
    case .LEFT:
        if c - 1 > minL {
            c = c - 1
        } else {
            minL = c
            if r - 1 > minU {
                r = r - 1
                direction = .UP
            } else {
                return false
            }
        }
    case .RIGHT:
        if c + 1 < maxR {
            c = c + 1
        } else {
            maxR = c
            if r + 1 < maxD {
                r = r + 1
                direction = .DOWN
            } else {
                return false
            }
        }
    }

    return true
}
