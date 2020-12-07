//
//  0324.wiggleSort.swift
//  AllProblems
//
//  Created by liuning on 2020/12/1.
//

import Foundation

func wiggleSort(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }

    let count = nums.count
    placeKth(&nums, 0, count - 1, (count-1)/2)
    threeWayPartition(&nums)

    let nums1 = Array(nums[0...(count-1)/2].reversed())
    let nums2 = Array(nums[(count-1)/2+1..<count].reversed())

    var res = Array(repeating: 0, count: count)
    for i in 0...(count-1)/2 {
        if i < nums1.count { res[2*i] = nums1[i] }
        if i < nums2.count { res[2*i+1] = nums2[i] }
    }

    nums = res
}

func placeKth(_ nums: inout [Int], _ from: Int, _ to: Int, _ k: Int) {
    let pivot = to
    var i = from
    var j = from
    while i < to {
        if nums[i] < nums[pivot] {
            swap(&nums, i, j)
            i += 1
            j += 1
        } else {
            i += 1
        }
    }

    swap(&nums, j, pivot)

    if j > k {
        placeKth(&nums, from, j - 1, k)
    } else if j < k {
        placeKth(&nums, j + 1, to, k)
    }
}

func threeWayPartition(_ nums: inout [Int]) {
    var i = 0
    var j = 0
    var k = nums.count - 1
    let mid = k/2

    while i < k {
        if nums[i] < nums[mid] {
            swap(&nums, i, j)
            i += 1
            j += 1
        } else if nums[i] > nums[mid] {
            swap(&nums, i, k)
            k -= 1
        } else {
            i += 1
        }
    }
}

private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}
