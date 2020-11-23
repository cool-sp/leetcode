//
//  0128.longestConsecutive.swift
//  AllProblems
//
//  Created by liuning on 2020/11/22.
//

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }

    let set = Set(nums)
    var maxLen = 1

    for (_, val) in nums.enumerated() {
        // don't need to find here
        // the lower value (val-1) will cover it
        if set.contains(val-1) { continue }

        var i = 1
        while(true) {
            if !set.contains(val+i) { break }
            i = i+1
        }
        maxLen = max(maxLen, i)
    }

    return maxLen
}
