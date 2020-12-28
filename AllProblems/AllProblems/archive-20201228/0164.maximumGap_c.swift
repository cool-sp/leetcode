//
//  0164.maximumGap.swift
//  AllProblems
//
//  Created by liuning on 2020/12/25.
//

import Foundation

func maximumGap(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else { return 0 }

    var max = Int.min
    var min = Int.max
    for num in nums {
        if num > max { max = num }
        if num < min { min = num }
    }

    if (max == min) { return 0 }

    let distance = Swift.max(1, (max - min) / (nums.count - 1))
    let bucketCount = (max - min) / distance + 1

    var bucket = Array(repeating: (Int.max, Int.min), count: bucketCount)
    for num in nums {
        let idx = (num - min) / distance

        // update min in each bucket
        if num < bucket[idx].0 {
            bucket[idx].0 = num
        }
        // update max in each bucket
        if num > bucket[idx].1 {
            bucket[idx].1 = num
        }
    }

    var res = Int.min
    var prev = 0
    for curr in 1..<bucketCount {
        if bucket[curr].0 == Int.max { continue }
        let temp = bucket[curr].0 - bucket[prev].1
        if temp > res { res = temp }
        prev = curr
    }

    return res
}
