//
//  isIsomorphic.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/184/comparison-with-other-data-structures/1117/

import Foundation

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if s.count != t.count { return false }

    var map = [Character: Character]()
    var set = Set<Character>()
    var idx = s.startIndex
    while idx != s.endIndex {
        let c1 = s[idx]
        let c2 = t[idx]
        if let mapped1 = map[c1] {
            if mapped1 != c2 { return false }
        } else {
            map[c1] = c2
            set.insert(c2)
            if map.keys.count != set.count { return false }
        }

        idx = s.index(after: idx)
    }

    return true
}
