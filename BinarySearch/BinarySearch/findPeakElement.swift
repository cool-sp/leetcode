//
//  findPeakElement.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/126/template-ii/948/

import Foundation

func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1

    while(left <= right) {
        let mid = left + (right-left)/2
        let check = checkPeak(nums, mid)
        if check < 0 {
            left = mid + 1
        } else if check == 0 {
            return mid
        } else {
            right = mid - 1
        }
    }

    return -1
}

func checkPeak(_ nums: [Int], _ idx: Int) -> Int {
    let left = idx == 0 ? Int.min : nums[idx-1]
    let right = idx == nums.count-1 ? Int.min : nums[idx+1]

    if left < nums[idx] && nums[idx] < right {
        return -1 // up
    } else if left < nums[idx] && nums[idx] > right {
        return 0  // peak
    } else {
        return 1  // down
    }
}
