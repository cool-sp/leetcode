//
//  splitArray.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/12.
//

// https://leetcode.com/explore/learn/card/binary-search/146/more-practices-ii/1042/

import Foundation

func splitArray(_ nums: [Int], _ m: Int) -> Int {
    if nums.count <= 0 { return Int.min }
    if m > nums.count { return Int.min }

    var left = 0
    var right = nums.reduce(0, +)

    while(left <= right) {
        let mid = left + (right-left)/2

        if countOfSplit(nums, mid) <= m {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return left
}

private func countOfSplit(_ nums: [Int], _ limit: Int) -> Int {
    var count = 1
    var sum = 0

    for num in nums {
        if num > limit {
            return Int.max
        }
        if num + sum > limit {
            sum = num
            count += 1
        } else {
            sum += num
        }
    }

    return count
}
