//
//  singleNumber.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/183/combination-with-other-algorithms/1176/

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for num in nums {
        if set.contains(num) {
            set.remove(num)
        } else {
            set.insert(num)
        }
    }

    return set.first!
}
