//
//  0016.threeSumClosest.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count >= 3 else { return -1 }

    let nums = nums.sorted()
    var minDistance = Int.max
    var res = -1

    for i in 0..<nums.count {
        let t = target - nums[i]
        var lft = i + 1
        var rht = nums.count - 1

        while (lft < rht) {
            let sum = nums[lft] + nums[rht]
            if sum == t {
                return target
            } else {
                if abs(sum - t) < minDistance {
                    minDistance = abs(sum - t)
                    res = sum + nums[i]
                }

                if sum > t {
                    rht -= 1
                } else {
                    lft += 1
                }
            }
        }
    }

    return res
}
