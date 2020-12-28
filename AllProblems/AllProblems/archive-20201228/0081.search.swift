//
//  0081.search.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func search(_ nums: [Int], _ target: Int) -> Bool {
    guard nums.count > 0 else { return false }

    var lft = 0
    var rht = nums.count - 1
    while lft <= rht {
        let mid = lft + (rht - lft) / 2

        // we are happy, return
        if target == nums[mid] {
            return true
        }

        if nums[mid] == nums[lft] {
            lft += 1
        } else if nums[mid] == nums[rht] {
            rht -= 1
        } else if nums[mid] > nums[lft] {
            if target <= nums[mid] && target >= nums[lft] {
                rht = mid - 1
            } else {
                lft = mid + 1
            }
        } else if nums[mid] < nums[rht] {
            if target >= nums[mid] && target <= nums[rht] {
                lft = mid + 1
            } else {
                rht = mid - 1
            }
        }
    }

    return false
}
