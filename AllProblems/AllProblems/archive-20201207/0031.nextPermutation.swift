//
//  0031.nextPermutation.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func nextPermutation(_ nums: inout [Int]) {
    if nums.count <= 1 { return }

    var upIdx = -1
    for i in stride(from: nums.count-2, to: -1, by: -1) {
        if nums[i] < nums[i+1] {
            upIdx = i
            break
        }
    }

    if upIdx < 0 {
        reverse(&nums, 0, nums.count-1)
        return
    }

    for j in stride(from: nums.count-1, to: upIdx, by: -1) {
        if nums[j] > nums[upIdx] {
            swap(&nums, j, upIdx)
            break
        }
    }

    reverse(&nums, upIdx+1, nums.count-1)
}

private func reverse(_ nums: inout [Int], _ i: Int, _ j: Int) {
    var i = i
    var j = j
    while i < j {
        swap(&nums, i, j)
        i += 1
        j -= 1
    }
}

private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}
