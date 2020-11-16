//
//  groupAnagrams.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/185/hash_table_design_the_key/1124/

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map = [String: [Int]]()

    var idx = 0
    for str in strs {
        let sorted = String(str.sorted())
        map[sorted, default:[]].append(idx)
        idx += 1
    }

    return map.values.map { arr -> [String] in
        var mapped = [String]()
        for idx in arr {
            mapped.append(strs[idx])
        }
        return mapped
    }
}
