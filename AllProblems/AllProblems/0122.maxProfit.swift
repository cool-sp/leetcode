//
//  0122.maxProfit.swift
//  AllProblems
//
//  Created by liuning on 2020/11/22.
//

import Foundation

func maxProfit122(_ prices: [Int]) -> Int {
    if prices.count <= 1 { return 0 }

    var left = 0
    var right = 1
    var prevRight = 0
    var result = 0
    var isRaising = false

    while(right < prices.count) {
        if prices[right] < prices[prevRight] {
            result += prices[prevRight] - prices[left]
            left = right
            isRaising = false
        } else if prices[right] > prices[prevRight] {
            isRaising = true
        }

        prevRight = right
        right += 1
    }

    // calculate the last raising part, make sure we don't miss it
    if isRaising {
        result += prices[prevRight] - prices[left]
    }

    return result
}
