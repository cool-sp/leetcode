//
//  firstUniqChar.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/184/comparison-with-other-data-structures/1120/

import Foundation

func firstUniqChar(_ s: String) -> Int {
    var map = [Character: Int]()

    var idx = s.startIndex
    while(idx != s.endIndex) {
        map[s[idx], default: 0] += 1

        idx = s.index(after: idx)
    }

    var ret = 0
    for ch in s {
        if map[ch] == 1 { return ret }
        else { ret += 1 }
    }

    return -1
}
