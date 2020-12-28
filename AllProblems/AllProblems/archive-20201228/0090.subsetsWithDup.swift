//
//  0090.subsetsWithDup.swift
//  AllProblems
//
//  Created by liuning on 2020/12/11.
//

import Foundation

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var res = [[Int]]()
    res.append([])
    backtrace(nums, -1, [], &res)
    return res
}

private func backtrace(_ nums: [Int], _ lastIdx: Int, _ path: [Int], _ res: inout [[Int]]) {
    var prevIdx = -1
    var idx = lastIdx + 1
    while idx < nums.count {
        if prevIdx < 0 || nums[prevIdx] != nums[idx] {
            prevIdx = idx

            var newPath = path
            newPath.append(nums[idx])
            res.append(newPath)

            backtrace(nums, idx, newPath, &res)
        }

        idx += 1
    }
}
