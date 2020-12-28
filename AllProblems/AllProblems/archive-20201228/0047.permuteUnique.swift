//
//  0047.permuteUnique.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var res = [[Int]]()
    calculate(nums, Set<Int>(), [], &res)

    return res
}

private func calculate(_ nums: [Int], _ record: Set<Int>, _ path: [Int], _ res: inout [[Int]]) {
    if record.count == nums.count {
        res.append(path)
    }

    var preIdx = -1
    for (idx, val) in nums.enumerated() where preIdx < 0 || val != nums[preIdx] {
        if record.contains(idx) { continue }
        preIdx = idx
        var newRecord = record
        var newPath = path
        newRecord.insert(idx)
        newPath.append(val)
        calculate(nums, newRecord, newPath, &res)
    }
}
