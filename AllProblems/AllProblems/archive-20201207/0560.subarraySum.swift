//
//  0560.subarraySum.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    // build the pre-sum array
    var preSum = Array(repeating: 0, count: nums.count)
    var sum = 0
    for i in 0..<nums.count {
        preSum[i] = nums[i] + sum
        sum = preSum[i]
    }

    // the sum of nums[i...j] is preSum[j] - preSum[i-1]
    // we want preSum[j] - preSum[i-1] = k
    var count = 0
    var map = [Int: Int]()
    map[0] = 1 // to simulate preSum[-1]
    for i in 0..<preSum.count {
        if let cnt = map[preSum[i] - k] {
            count += cnt
        }

        map[preSum[i], default:0] += 1
    }

    return count
}
