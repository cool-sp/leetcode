//
//  0312.maxCoins.swift
//  AllProblems
//
//  Created by liuning on 2020/12/6.
//

import Foundation

func maxCoins(_ nums: [Int]) -> Int {
    var arr = [1]
    arr.append(contentsOf: nums)
    arr.append(1)

    var memory = Array(repeating: Array(repeating: 0, count: arr.count), count: arr.count)
    let ret = maxCoinsHelper(&arr, 0, arr.count-1, &memory)
    return ret
}

private func maxCoinsHelper(_ nums: inout [Int], _ i: Int, _ j: Int, _ memory: inout [[Int]]) -> Int {
    if i >= j - 1 { return 0 }

    if memory[i][j] > 0 {
        return memory[i][j]
    }

    var max = 0
    for k in i+1..<j {
        let lft = maxCoinsHelper(&nums, i, k, &memory)
        let mid = nums[i]*nums[k]*nums[j]
        let rht = maxCoinsHelper(&nums, k, j, &memory)

        max = Swift.max(max, lft+mid+rht)
    }

    memory[i][j] = max
    return max
}
