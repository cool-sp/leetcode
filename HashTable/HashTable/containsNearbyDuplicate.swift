//
//  containsNearbyDuplicate.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/184/comparison-with-other-data-structures/1121/

import Foundation

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var map = [Int: Int]()

    for idx in 0..<nums.count {
        if let prev = map[nums[idx]] {
            if idx - prev <= k { return true }
        }
        map[nums[idx]] = idx
    }

    return false
}

