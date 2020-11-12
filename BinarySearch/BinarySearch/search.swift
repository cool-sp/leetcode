//
//  search.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/138/background/1038/

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count

    while(left < right) {
        let mid = left + (right-left)/2
        let midVal = nums[mid]

        if target == midVal {
            return mid
        } else if target < midVal {
            right = mid
        } else if target > midVal {
            left = mid + 1
        }
    }

    return -1
}
