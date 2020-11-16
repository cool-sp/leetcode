//
//  topKFrequent.swift
//  HashTable
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/hash-table/187/conclusion-hash-table/1133/

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    return nums
        .reduce(into: [:]) { (frequencyMap, num) in  frequencyMap[num, default: 0] += 1 }
        .sorted {$0.value > $1.value}
        .prefix(k)
        .map {$0.key }
}
