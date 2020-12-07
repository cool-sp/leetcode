//
//  0085.maximalRectangle.swift
//  AllProblems
//
//  Created by liuning on 2020/12/7.
//

import Foundation


func maximalRectangle(_ matrix: [[Character]]) -> Int {
    let rowCnt = matrix.count
    guard rowCnt > 0 else { return 0 }
    let colCnt = matrix[0].count
    guard colCnt > 0 else { return 0 }

    var maxVal = 0
    var dp = Array(repeating: 0, count: colCnt)
    for r in 0..<rowCnt {
        for c in 0..<colCnt {
            dp[c] = matrix[r][c] == "0" ? 0 : dp[c] + 1
        }
        maxVal = max(maxVal, largestArea(dp))
    }

    return maxVal
}

// leetcode 84
private func largestArea(_ heights: [Int]) -> Int {
    var heights = heights
    heights.insert(0, at: 0)
    heights.append(0)

    var idxStack = [Int]()
    idxStack.append(0)
    var maxArea = 0

    var idx = 1
    while idx < heights.count {
        let height = heights[idx]

        while heights[idxStack.last!] > height {
            let h = heights[idxStack.removeLast()]
            let p = idxStack.isEmpty ? -1 : idxStack.last!
            maxArea = max(maxArea, h * (idx - p - 1))
        }

        if heights[idxStack.last!] < height {
            idxStack.append(idx)
        } else if heights[idxStack.last!] == height {
            idxStack.removeLast()
            idxStack.append(idx)
        }

        idx += 1
    }

    return maxArea
}
