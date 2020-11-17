//
//  minSubArrayLen.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/205/array-two-pointer-technique/1299/

import Foundation

func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    if nums.count <= 0 { return 0 }

    var start = 0
    var end = 0
    var sum = 0
    var minLen = Int.max

    while(start <= end && end < nums.count) {
        sum += nums[end]
        if sum >= s {
            minLen = min(minLen, end - start + 1)

            sum -= nums[start]
            start += 1
            if start > end {
                end += 1
            } else {
                // avoid duplicate calcuation of end in next loop
                sum -= nums[end]
            }
        } else {
            end += 1
        }
    }

    return minLen == Int.max ? 0 : minLen
}
