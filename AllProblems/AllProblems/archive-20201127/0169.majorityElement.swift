//
//  0169.majorityElement.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return Int.min }

    var feq = [Int: Int]()
    for (_, val) in nums.enumerated() {
        feq[val,default:0] += 1
    }

    var res = 0
    var maxCnt = Int.min
    for (val, cnt) in feq {
        if cnt > maxCnt {
            maxCnt = cnt
            res = val
        }
    }

    return res
}
