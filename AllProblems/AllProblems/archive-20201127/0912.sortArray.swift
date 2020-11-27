//
//  0912.sortArray.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func sortArray(_ nums: [Int]) -> [Int] {
    if nums.count <= 0 { return [] }

    var nums = nums
    sort(&nums, 0, nums.count-1)
    return nums
}

private func sort(_ nums: inout [Int], _ from: Int, _ to: Int) {
    if from >= to { return }

    let mid = partition(&nums, from, to)
    if mid > 0 { sort(&nums, from, mid-1) }
    if mid < to { sort(&nums, mid+1, to) }
}

private func partition(_ nums: inout [Int], _ from: Int, _ to: Int) -> Int {
    if from >= to { return from }

    let x = Int.random(in: from...to)
    swap(&nums, x, to)

    let pivot = to
    var j = from
    for i in from..<to {
        if nums[i] < nums[pivot] {
            swap(&nums, i, j)
            j += 1
        }
    }

    swap(&nums, pivot, j)
    return j
}

private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}
