//
//  containsDuplicate.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/183/combination-with-other-algorithms/1112/

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    var set = Set<Int>()
    for num in nums {
        if set.contains(num) {
            return true
        }
        set.insert(num)
    }
    return false
}
