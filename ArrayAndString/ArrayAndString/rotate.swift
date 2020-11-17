//
//  rotate.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/204/conclusion/1182/

import Foundation

func rotate(_ nums: inout [Int], _ k: Int) {
    if nums.count <= 1 { return }
    if k % nums.count < 1 { return }

    var processed = cycle(&nums, 0, k)
    var idx = 1
    while(processed < nums.count) {
        processed += cycle(&nums, idx, k)
        idx += 1
    }
}

private func cycle(_ nums: inout [Int], _ start: Int, _ k: Int) -> Int {
    var processCnt = 0
    let len = nums.count
    var curr = start
    var next = (curr + k) % len
    var cache = nums[curr]
    while(next != start) {
        let temp = cache
        cache = nums[next]
        nums[next] = temp

        curr = next
        next = (next + k) % len
        processCnt += 1
    }
    nums[next] = cache
    processCnt += 1

    return processCnt
}
