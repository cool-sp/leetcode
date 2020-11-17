//
//  twoSum.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/205/array-two-pointer-technique/1153/

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    if numbers.count <= 1 { return [] }

    var left = 0
    var right = numbers.count - 1
    while(left <= right) {
        if numbers[left] + numbers[right] > target {
            right = right - 1
        } else if numbers[left] + numbers[right] < target {
            left = left + 1
        } else {
            return [left+1, right+1]
        }
    }

    return []
}
