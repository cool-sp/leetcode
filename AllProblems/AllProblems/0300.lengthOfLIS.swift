//
//  0300.lengthOfLIS.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

// https://leetcode-cn.com/problems/longest-increasing-subsequence/solution/yi-bu-yi-bu-tui-dao-chu-guan-fang-zui-you-jie-fa-x/

func lengthOfLIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }

    var res = [Int]()
    res.append(nums[0])

    var idx = 1
    while(idx < nums.count) {
        let found = searchAndInsert(res, nums[idx])
        if found < res.count {
            res[found] = nums[idx]
        } else {
            res.append(nums[idx])
        }
        idx += 1
    }
    return res.count
}

private func searchAndInsert(_ arr: [Int], _ val: Int) -> Int {
    var lft = 0
    var rht = arr.count - 1

    while(lft <= rht) {
        let mid = lft + (rht - lft) / 2
        if arr[mid] >= val {
            rht = mid - 1
        } else {
            lft = mid + 1
        }
    }

    return lft
}

//func lengthOfLIS(_ nums: [Int]) -> Int {
//    guard nums.count > 0 else { return 0 }
//
//    var dp = Array(repeating: 0, count: nums.count)
//    dp[0] = 1
//
//    var idx = 1
//    while(idx < nums.count) {
//        var max = 0
//        for i in 0..<idx {
//            if nums[idx] > nums[i] && dp[i] > max {
//                max = dp[i]
//            }
//        }
//
//        dp[idx] = max + 1
//        idx += 1
//    }
//
//    return dp.max()!
//}
