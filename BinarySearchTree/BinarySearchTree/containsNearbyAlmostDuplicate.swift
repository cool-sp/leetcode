//
//  containsNearbyAlmostDuplicate.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/142/conclusion/1013/

import Foundation

func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
    guard k > 0, t >= 0 else { return false }
    guard nums.count > 0 else { return false }

    var map = [Int: Int]()

    var index = 0
    for num in nums {
        let bucket = getBucketNumber(num, t)

        if map[bucket] != nil {
            return true
        }
        else if map[bucket-1] != nil && abs(num - map[bucket-1]!) <= t {
            return true
        }
        else if map[bucket+1] != nil && abs(num - map[bucket+1]!) <= t {
            return true
        }

        map[bucket] = num
        if index >= k {
            map[getBucketNumber(nums[index-k], t)] = nil
        }
        index += 1
    }

    return false
}

private func getBucketNumber(_ n: Int, _ t: Int) -> Int {
    if n >= 0 { return n/(t+1) }
    else { return n/(t+1) - 1 }
}
