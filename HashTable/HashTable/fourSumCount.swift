//
//  fourSumCount.swift
//  HashTable
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/hash-table/187/conclusion-hash-table/1134/

import Foundation

func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var record = [Int: Int]()

    for ia in 0..<A.count {
        for ib in 0..<B.count {
            record[A[ia] + B[ib], default:0] += 1
        }
    }

    var result = 0
    for ic in 0..<C.count {
        for id in 0..<D.count {
            let target = 0 - C[ic] - D[id]
            if let cnt = record[target] {
                result += cnt
            }
        }
    }

    return result
}
