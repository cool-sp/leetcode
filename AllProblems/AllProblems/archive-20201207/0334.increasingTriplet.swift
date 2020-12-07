//
//  0334.increasingTriplet.swift
//  AllProblems
//
//  Created by liuning on 2020/12/2.
//

import Foundation

func increasingTriplet(_ nums: [Int]) -> Bool {
    guard nums.count >= 3 else { return false }

    var res = [Int]()
    res.append(nums[0])

    for i in 1..<nums.count {
        let idx = findFirstSmaller(res, nums[i])
        if idx >= res.count {
            res.append(nums[i])
        } else {
            res[idx] = nums[i]
        }

        if res.count >= 3 { return true }
    }

    return false
}

func findFirstSmaller(_ arr: [Int], _ val: Int) -> Int {
    var lft = 0
    var rht = arr.count - 1

    while lft <= rht {
        let mid = lft + (rht - lft) / 2
        if arr[mid] < val {
            lft += 1
        } else {
            rht -= 1
        }
    }

    return lft
}
