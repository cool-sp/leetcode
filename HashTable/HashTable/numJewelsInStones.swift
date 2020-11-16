//
//  numJewelsInStones.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/187/conclusion-hash-table/1136/

import Foundation

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var set = Set<Character>()

    for j in J {
        set.insert(j)
    }

    var count = 0
    for s in S {
        if set.contains(s) { count += 1 }
    }

    return count
}
