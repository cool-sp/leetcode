//
//  0416.canPartition.swift
//  AllProblems
//
//  Created by liuning on 2020/12/5.
//

import Foundation

func canPartition(_ nums: [Int]) -> Bool {
    // define dp[i][j] as:
    // pick numbers in nums[0...i], we have the sum equals target
    let sum = nums.reduce(0, +)
    if sum % 2 == 1 { return false }
    let target = sum / 2

    var dp = Array(repeating: Array(repeating: false, count: target+1), count: nums.count)

    if nums[0] <= target {
        dp[0][nums[0]] = true
    }

    for i in 1..<nums.count {
        for j in 1...target {
            if j < nums[i] {
                dp[i][j] = dp[i-1][j]
            } else if j == nums[i] {
                dp[i][j] = true
            } else {
                dp[i][j] = dp[i-1][j] || dp[i-1][j-nums[i]]
            }
        }
    }

    return dp[nums.count-1][target]
}

// optimization 1: return earlier if we found the target already
// 924 ms -> 804 ms

func canPartition2(_ nums: [Int]) -> Bool {
    // define dp[i][j] as:
    // pick numbers in nums[0...i], we have the sum equals target
    let sum = nums.reduce(0, +)
    if sum % 2 == 1 { return false }
    let target = sum / 2

    var dp = Array(repeating: Array(repeating: false, count: target+1), count: nums.count)

    if nums[0] <= target {
        dp[0][nums[0]] = true
    }

    for i in 1..<nums.count {
        for j in 1...target {
            if j < nums[i] {
                dp[i][j] = dp[i-1][j]
            } else if j == nums[i] {
                dp[i][j] = true
            } else {
                dp[i][j] = dp[i-1][j] || dp[i-1][j-nums[i]]
            }

            if dp[i][target] == true {
                return true
            }
        }
    }

    return dp[nums.count-1][target]
}

// optimization 2: use only 1-D array and reverse the traversal
// 804 ms -> 884 ms (???)
// 15.3 M -> 13.8 M

func canPartition3(_ nums: [Int]) -> Bool {
    // define dp[i][j] as:
    // pick numbers in nums[0...i], we have the sum equals target
    let sum = nums.reduce(0, +)
    if sum % 2 == 1 { return false }
    let target = sum / 2

    var dp = Array(repeating: false, count: target+1)

    if nums[0] <= target {
        dp[nums[0]] = true
    }

    for i in 1..<nums.count {
        for j in stride(from: target, to: 0, by: -1) {
            if j == nums[i] {
                dp[j] = true
            } else if j > nums[i] {
                dp[j] = dp[j] || dp[j-nums[i]]
            }

            if dp[target] == true {
                return true
            }
        }
    }

    return dp[target]
}

