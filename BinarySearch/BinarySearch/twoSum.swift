//
//  twoSum.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/144/more-practices/1035/

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var record = [Int: Int]()
    for idx in 0..<numbers.count {
        if let prevIdx = record[numbers[idx]] {
            return [prevIdx+1, idx+1]
        }
        let expect = target - numbers[idx]
        record[expect] = idx
    }

    return []
}
