//
//  smallestDistancePair.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/12.
//

// https://leetcode.com/explore/learn/card/binary-search/146/more-practices-ii/1041/

import Foundation

func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count > 1 else { return Int.min }
    guard k >= 1 else { return Int.min }
    guard k <= nums.count*(nums.count-1)/2 else { return Int.min }

    let arr = nums.sorted()
    let min = arr[0]
    let max = arr[arr.count-1]

    var left = 0
    var right = max - min

    while(left <= right) {
        let mid = left + (right-left)/2

        if countOfPairs(arr, mid) < k {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return left
}

private func countOfPairs(_ arr: [Int], _ uplimit: Int) -> Int {
    var count = 0
    var left = 0
    for right in 0..<arr.count {
        while(left < right && arr[right] - arr[left] > uplimit) {
            left += 1
        }
        count += right - left
    }
    return count
}
