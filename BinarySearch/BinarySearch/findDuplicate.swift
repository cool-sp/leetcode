//
//  findDuplicate.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/146/more-practices-ii/1039/

import Foundation

func findDuplicate(_ nums: [Int]) -> Int {
    var cache = Set<Int>()
    for n in nums {
        if cache.contains(n) {
            return n
        }
        cache.insert(n)
    }
    return 0
}
