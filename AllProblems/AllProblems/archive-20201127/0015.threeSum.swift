//
//  0015.threeSum.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    guard nums.count >= 3 else { return [] }

    var result = [[Int]]()
    var i = 0
    while(i<nums.count-2) {
        let pairs = getPair(-nums[i], nums, i+1)
        for pair in pairs {
            result.append([nums[i], pair.0, pair.1])
        }

        // // skip same value, so that we don't have same pair
        while(i < nums.count-1 && nums[i] == nums[i+1]) { i += 1 }

        i += 1
    }

    return result
}

private func getPair(_ target: Int, _ nums: [Int], _ offset: Int) -> [(Int, Int)] {
    guard offset <= nums.count - 2 else { return [] }

    var left = offset
    var right = nums.count - 1

    var result = [(Int, Int)]()
    while(left < right) {
        if nums[left] + nums[right] == target {
            result.append((nums[left], nums[right]))

            // skip same value, so that we don't have same pair
            while(left < nums.count-1 && nums[left] == nums[left+1]) { left += 1 }
            while(right > offset && nums[right] == nums[right-1]) { right -= 1 }

            // move on, see if we have other pairs
            left += 1
        } else if nums[left] + nums[right] < target {
            left += 1
        } else {
            right -= 1
        }
    }

    return result
}
