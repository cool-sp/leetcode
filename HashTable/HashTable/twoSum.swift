//
//  twoSum.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/184/comparison-with-other-data-structures/1115/

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for idx in 0..<nums.count {
        let expect = target - nums[idx]
        if let idx2 = map[expect] {
            return [idx, idx2]
        } else {
            map[nums[idx]] = idx
        }
    }

    return [-1, -1]
}
