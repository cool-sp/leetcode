//
//  0135.candy.swift
//  AllProblems
//
//  Created by liuning on 2020/12/25.
//

import Foundation

func candy(_ ratings: [Int]) -> Int {
    guard ratings.count > 0 else { return 0 }

    var candyArr = Array(repeating: 1, count: ratings.count)

    for i in 1..<ratings.count {
        if ratings[i] > ratings[i-1] {
            candyArr[i] = candyArr[i-1] + 1
        }
    }

    for j in stride(from: ratings.count-2, to: -1, by: -1) {
        if ratings[j] > ratings[j+1] {
            candyArr[j] = max(candyArr[j], candyArr[j+1] + 1)
        }
    }

    return candyArr.reduce(0, +)
}
