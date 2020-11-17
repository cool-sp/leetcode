//
//  dominantIndex.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/201/introduction-to-array/1147/

import Foundation

func dominantIndex(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return -1 }
    if nums.count == 1 { return 0 }

    var top1 = Int.min
    var top1_idx = -1
    var top2 = Int.min

    for idx in 0..<nums.count {
        if nums[idx] > top1 {
            top2 = top1
            top1 = nums[idx]
            top1_idx = idx
        } else if nums[idx] > top2 {
            top2 = nums[idx]
        }
    }

    if top1 >= top2*2 { return top1_idx }
    else { return -1 }
}
