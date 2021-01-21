//
//  0303.NumArray.swift
//  AllProblems
//
//  Created by liuning on 2021/1/3.
//

import Foundation

class NumArray {
    var prefixSum: [Int]

    init(_ nums: [Int]) {
        prefixSum = Array(repeating: 0, count: nums.count+1)
        prefixSum[0] = 0

        var i = 1
        while i <= nums.count {
            prefixSum[i] = prefixSum[i-1] + nums[i-1]
            i += 1
        }
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        return prefixSum[j+1] - prefixSum[i]
    }
}
