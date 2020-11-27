//
//  0121.maxProfit.swift
//  AllProblems
//
//  Created by liuning on 2020/11/22.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    if prices.count <= 1 { return 0 }

    var minPos = -1
    var maxPos = -1
    var minVal = Int.max
    var maxVal = Int.min

    var result = 0

    for (idx, val) in prices.enumerated() {
        if val < minVal {
            minVal = val
            minPos = idx

            if maxPos < minPos {
                maxPos = minPos
                maxVal = minVal
            }
        }

        if val > maxVal {
            maxVal = val
            maxPos = idx
            result = max(result, maxVal - minVal)
        }
    }

    return result
}
