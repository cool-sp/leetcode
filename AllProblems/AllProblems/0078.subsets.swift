//
//  0078.subsets.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    result.append([])

    var cnt = 0
    while(cnt < nums.count) {
        var copy = result
        for idx in 0..<copy.count {
            copy[idx].append(nums[cnt])
        }
        result.append(contentsOf: copy)

        cnt += 1
    }

    return result
}
