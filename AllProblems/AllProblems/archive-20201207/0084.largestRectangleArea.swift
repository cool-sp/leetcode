//
//  0084.largestRectangleArea.swift
//  AllProblems
//
//  Created by liuning on 2020/12/7.
//

import Foundation

// https://www.youtube.com/watch?v=XwUb7x6YDeA
func largestRectangleArea(_ heights: [Int]) -> Int {
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
