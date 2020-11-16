//
//  intersect.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/184/comparison-with-other-data-structures/1178/

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.count <= 0 || nums2.count <= 0 { return [] }
    if nums1.count > nums2.count { return intersect(nums2, nums1) }

    let m1 = generateMap(nums1)
    let m2 = generateMap(nums2)

    var result = [Int]()
    for (num, c1) in m1 {
        if let c2 = m2[num] {
            result.append(contentsOf: Array(repeating: num, count: min(c1, c2)))
        }
    }
    return result
}

private func generateMap(_ nums: [Int]) -> [Int: Int] {
    var result = [Int: Int]()

    for n in nums {
        result[n, default:0] += 1
    }

    return result
}
