//
//  searchRotated.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/125/template-i/952/

import Foundation

func searchRotated(_ nums: [Int], _ target: Int) -> Int {
    if nums.count <= 0 { return -1 }
    var left = 0
    var right = nums.count - 1

    while(left <= right) {
        let mid = left+(right-left)/2
        let midVal = nums[mid]

        if target == midVal {
            return mid
        } else if target < midVal {
            if midVal >= nums[left] && midVal >= nums[right] {
                if nums[left] > target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                right = mid - 1
            }

        } else if target > midVal {
            if midVal <= nums[left] && midVal <= nums[right] {
                if target > nums[right] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                left = mid + 1
            }
        }
    }

    return -1
}
