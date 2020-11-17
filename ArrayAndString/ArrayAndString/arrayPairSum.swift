//
//  arrayPairSum.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/205/array-two-pointer-technique/1154/

import Foundation

func arrayPairSum(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return 0}

    let sorted = nums.sorted()
    var index = 0
    var sum = 0
    while(index < sorted.count) {
        sum += sorted[index]
        index += 2
    }

    return sum
}
