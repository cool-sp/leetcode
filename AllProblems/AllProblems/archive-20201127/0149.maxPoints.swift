//
//  0149.maxPoints.swift
//  AllProblems
//
//  Created by liuning on 2020/11/24.
//

import Foundation

private func shrinkWithGCD(_ deltaX: Int, _ deltaY: Int) -> String {
    // calculate GCD (Greatest Common Divisor)
    // gcd(a, b) = gcd(b, a mode b)
    var x = deltaX
    var y = deltaY
    while(y != 0) {
        let t = y
        y = x % y
        x = t
    }

    let gcd = x
    return "\(deltaX/gcd),\(deltaY/gcd)"
}

func maxPoints(_ points: [[Int]]) -> Int {
    if points.count <= 0 { return 0 }
    if points.count <= 2 { return points.count }

    var maxVal = 0
    for i in 0..<points.count-1 {
        let base = points[i]
        var duplicateCount = 0
        var map = [String: Int]()

        for j in i+1..<points.count {
            let other = points[j]
            // same point with base point, skip it
            if base[0] == other[0] && base[1] == other[1] {
                duplicateCount += 1
                continue
            }

            let deltaX = other[0] - base[0]
            let deltaY = other[1] - base[1]
            let slope = shrinkWithGCD(deltaX, deltaY)
            map[slope, default:0] += 1
        }

        if map.count <= 0 {
            maxVal = max(maxVal, duplicateCount+1)
        } else {
            maxVal = max(maxVal, map.values.max()! + duplicateCount + 1)
        }
    }

    return maxVal
}
