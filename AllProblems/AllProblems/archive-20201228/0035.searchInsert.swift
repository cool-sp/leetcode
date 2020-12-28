//
//  0035.searchInsert.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var lft = 0
    var rht = nums.count - 1

    while lft <= rht {
        let mid = lft + (rht - lft) / 2
        if target < nums[mid] {
            rht = mid - 1
        } else if target > nums[mid] {
            lft = mid + 1
        } else {
            return mid
        }
    }

    return lft
}
