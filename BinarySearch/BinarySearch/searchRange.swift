//
//  searchRange.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/135/template-iii/944/

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count <= 0 { return [-1, -1] }

    let targetIndex = searchTarget(nums, target)
    if targetIndex < 0 { return [-1, -1] }

    let left = searchLeft(nums, targetIndex, target)
    let right = searchRight(nums, targetIndex, target)

    return [left, right]
}

private func searchTarget(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1

    while(left <= right) {
        let mid = left + (right-left)/2
        let midVal = nums[mid]

        if target < midVal {
            right = mid - 1
        } else if target > midVal {
            left = left + 1
        } else {
            return mid
        }
    }
    return -1
}

private func searchLeft(_ nums: [Int], _ index: Int, _ target: Int) -> Int {
    var left = 0
    var right = index

    while(left <= right) {
        let mid = left + (right-left)/2
        let midVal = nums[mid]

        if target == midVal {
            right = mid - 1
        } else {
            left = left + 1
        }
    }

    return left
}

private func searchRight(_ nums: [Int], _ index: Int, _ target: Int) -> Int {
    var left = index
    var right = nums.count-1

    while(left <= right) {
        let mid = left + (right-left)/2
        let midVal = nums[mid]

        if target == midVal {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return right
}
