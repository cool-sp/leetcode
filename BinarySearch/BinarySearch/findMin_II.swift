//
//  searchRotated_II.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/144/more-practices/1031/

import Foundation

func findMin_II(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1

    while(left < right) {
        let mid = left + (right-left)/2
        let midVal = nums[mid]

        if midVal > nums[right] {
            left = mid + 1
        } else if midVal < nums[right] {
            right = mid
        } else {
            right -= 1
        }
    }

    return nums[left]
}
