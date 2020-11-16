//
//  intersection.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/183/combination-with-other-algorithms/1105/

import Foundation

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let set1 = Set<Int>(nums1)
    let set2 = Set<Int>(nums2)

    return Array(set1.intersection(set2))
}
