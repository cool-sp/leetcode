//
//  intersection.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/144/more-practices/1034/

import Foundation

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let set1 = Set<Int>(nums1)
    let set2 = Set<Int>(nums2)
    return Array(set1.intersection(set2))
}
