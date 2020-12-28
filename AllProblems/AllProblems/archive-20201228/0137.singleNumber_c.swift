//
//  0137.singleNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/12/24.
//

import Foundation

// https://leetcode-cn.com/problems/single-number-ii/solution/luo-ji-dian-lu-jiao-du-xiang-xi-fen-xi-gai-ti-si-l/

func singleNumber(_ nums: [Int]) -> Int {
    var x = 0
    var y = 0

    for n in nums {
        let prex = x
        let prey = y
        x = (prex)  & (~prey) & (~n) | (~prex) & prey & n
        y = (~prex) & (~prey) & n    | (~prex) & prey & (~n)
    }

    return y
}
