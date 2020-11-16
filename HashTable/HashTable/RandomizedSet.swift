//
//  RandomizedSet.swift
//  HashTable
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/hash-table/187/conclusion-hash-table/1141/

import Foundation

class RandomizedSet {

    var set = Set<Int>()

    init() {}

    func insert(_ val: Int) -> Bool {
        if !set.contains(val) {
            set.insert(val)
            return true
        }
        return false
    }

    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        }
        return false
    }

    func getRandom() -> Int {
        return set[randomIdx(set.count)]
    }

    private func randomIdx(_ val: Int) -> Set<Int>.Index {
        return set.index(set.startIndex, offsetBy: Int.random(in: 0..<val))
    }
}
