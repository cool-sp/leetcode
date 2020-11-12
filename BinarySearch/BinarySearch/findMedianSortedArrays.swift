//
//  findMedianSortedArrays.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/12.
//

// https://leetcode.com/explore/learn/card/binary-search/146/more-practices-ii/1040/

import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count <= 0 { return mid(nums2) }
    if nums2.count <= 0 { return mid(nums1) }

    if nums1.count > nums2.count {
        return findMedianSortedArrays(nums2, nums1)
    }

    let count1 = nums1.count
    let count2 = nums2.count
    let totalLeft = (count1 + count2 + 1)/2

    var lo = 0
    var hi = count1
    while(lo <= hi) {
        let i = lo + (hi-lo)/2
        let j = totalLeft - i

        if i >= 1 && nums1[i-1] > nums2[j] {
            hi = i - 1
        } else {
            lo = i + 1
        }
    }

    let i = lo - 1
    let j = totalLeft - i

    let leftMin1 = i-1<0 ? Int.min : nums1[i-1]
    let leftMin2 = j-1<0 ? Int.min : nums2[j-1]
    let rightMax1 = i>=count1 ? Int.max : nums1[i]
    let rightMax2 = j>=count2 ? Int.max : nums2[j]

    if (count1+count2) % 2 == 0 {
        return (Double)(max(leftMin1, leftMin2) + min(rightMax1, rightMax2))/2
    } else {
        return (Double)(max(leftMin1, leftMin2))
    }
}

private func mid(_ arr: [Int]) -> Double {
    if arr.count <= 0 { return (Double)(Int.min) }
    let cnt = arr.count
    let mid1 = arr[(cnt-1)/2]
    let mid2 = arr[cnt/2]
    return (Double)(mid1 + mid2)/2
}
