//
//  lengthOfLongestSubstring.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/187/conclusion-hash-table/1135/

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count <= 0 { return 0 }

    // convert to array of characters
    // for the purpose of high performance ...
    let s = Array(s)

    var i = 0
    var j = 1
    var record = [Character: Int]()
    var maxLen = 1

    record[s[0]] = 0
    while(j < s.count) {
        if let prevIdx = record[s[j]], prevIdx >= i {
            i = prevIdx + 1
            record[s[j]] = j
            j += 1
        } else {
            record[s[j]] = j
            j += 1
            if j - i > maxLen { maxLen = j - i }
        }
    }

    return maxLen
}

extension String {
    subscript(i: Int) -> Character {
        let idx = self.index(startIndex, offsetBy: i)
        return self[idx]
    }
}

