//
//  0229.majorityElement.swift
//  AllProblems
//
//  Created by liuning on 2020/12/29.
//

import Foundation

func majorityElement(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }

    var candidate_01 = Int.min
    var candidate_02 = Int.min
    var count_01 = 0
    var count_02 = 0

    for i in 0..<nums.count {
        let val = nums[i]

        if val == candidate_01 {
            count_01 += 1
        } else if val == candidate_02 {
            count_02 += 1
        } else if count_01 == 0 {
            candidate_01 = val
            count_01 += 1
        } else if count_02 == 0 {
            candidate_02 = val
            count_02 += 1
        } else {
            count_01 -= 1
            count_02 -= 1
        }
    }

    count_01 = 0
    count_02 = 0
    for val in nums {
        if val == candidate_01 {
            count_01 += 1
        }
        if val == candidate_02 {
            count_02 += 1
        }
    }

    var res = [Int]()
    if count_01 > nums.count/3 { res.append(candidate_01) }
    if count_02 > nums.count/3 { res.append(candidate_02) }
    return res
}
