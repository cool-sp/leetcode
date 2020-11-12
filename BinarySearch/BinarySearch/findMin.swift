//
//  findMin.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/126/template-ii/949/

import Foundation

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    var result = nums[0]

    while(left <= right) {
        let mid = left + (right-left)/2
        let midVal = nums[mid]

        if midVal >= result {
            left = mid + 1
        } else {
            result = midVal
            right = mid - 1
        }
    }

    return result
}


