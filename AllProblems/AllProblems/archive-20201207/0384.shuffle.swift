//
//  0384.shuffle.swift
//  AllProblems
//
//  Created by liuning on 2020/12/2.
//

import Foundation

class Solution {
    var bak: [Int]
    var arr: [Int]

    init(_ nums: [Int]) {
        bak = nums
        arr = nums
    }

    func reset() -> [Int] {
        return bak
    }

    func shuffle() -> [Int] {
        for i in 0..<arr.count {
            let idx = Int.random(in: 0..<arr.count)
            swap(&arr, i, idx)
        }

        return arr
    }

    private func swap(_ arr: inout [Int], _ i: Int, _ j: Int) {
        let temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
    }
}
