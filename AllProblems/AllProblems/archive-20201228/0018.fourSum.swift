//
//  0018.fourSum.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 4 else { return [] }
    let nums = nums.sorted()

    var res = [[Int]]()
    var preI = -1
    for i in 0..<nums.count where preI < 0 || nums[preI] != nums[i] {
        var preJ = -1
        for j in i+1..<nums.count where preJ < 0 || nums[preJ] != nums[j] {
            var lft = j + 1
            var rht = nums.count - 1
            let t = target - nums[i] - nums[j]

            var preLft = -1
            while lft < rht {
                let sum = nums[lft] + nums[rht]
                if sum == t && (preLft < 0 || nums[preLft] != nums[lft]) {
                    preLft = lft
                    preI = i
                    preJ = j
                    res.append([nums[i], nums[j], nums[lft], nums[rht]])
                } else if sum < t {
                    lft += 1
                } else {
                    rht -= 1
                }
            }
        }
    }

    return res
}
