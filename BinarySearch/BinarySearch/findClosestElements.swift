//
//  findClosestElements.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/135/template-iii/945/

import Foundation

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    guard arr.count >= k else { return [] }

    if arr[0] > x { return Array(arr[0..<k]) }
    if arr[arr.count-1] < x { return Array(arr[arr.count-k..<arr.count]) }


    var closest = findClosestIndex(arr, x)
    if closest > 0 && distance(arr, closest-1, x) <= distance(arr, closest, x) {
        closest -= 1
    }

    var left = closest
    var right = closest
    var remaining = k - 1

    while(remaining > 0) {
        if left > 0 && right < arr.count - 1 {
            if distance(arr, left-1, x) <= distance(arr, right+1, x) {
                left -= 1
            } else {
                right += 1
            }
        } else if left > 0 {
            left -= 1
        } else {
            right += 1
        }

        remaining -= 1
    }

    return Array(arr[left...right])
}

private func findClosestIndex(_ arr: [Int], _ x: Int) -> Int {
    var left = 0
    var right = arr.count - 1

    while(left <= right) {
        let mid = left + (right-left)/2
        let midVal = arr[mid]

        if x <= midVal {
            right = right - 1
        } else if x > midVal {
            left = left + 1
        }
    }

    return left
}

private func distance(_ arr: [Int], _ index: Int, _ x: Int) -> Int {
    return abs(arr[index] - x)
}
