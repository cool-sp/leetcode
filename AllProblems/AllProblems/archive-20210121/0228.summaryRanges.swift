//
//  0228.summaryRanges.swift
//  AllProblems
//
//  Created by liuning on 2020/12/29.
//

import Foundation

func summaryRanges(_ nums: [Int]) -> [String] {
    guard nums.count > 0 else { return [] }
    var res = [String]()

    var p = 0
    while p < nums.count {
        var q = p + 1

        var expect = nums[p] + 1
        while q < nums.count && nums[q] == expect {
            expect += 1
            q += 1
        }

        let prev = q - 1
        if p == prev {
            res.append("\(nums[p])")
        } else {
            res.append("\(nums[p])->\(nums[prev])")
        }

        p = q
    }

    return res
}
