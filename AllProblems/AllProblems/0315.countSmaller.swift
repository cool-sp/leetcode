//
//  0315.countSmaller.swift
//  AllProblems
//
//  Created by liuning on 2020/11/30.
//

import Foundation


class FenwickTree {
    var sum: [Int]

    init(_ n: Int) {
        sum = Array(repeating: 0, count: n+1)
    }

    func update(_ i: Int, _ delta: Int) {
        var i = i
        while(i < sum.count) {
            sum[i] += delta
            i += lowbit(i)
        }
    }

    func query(_ i: Int) -> Int {
        var res = 0
        var i = i
        while (i > 0) {
            res += sum[i]
            i -= lowbit(i)
        }
        return res
    }

    private func lowbit(_ i: Int) -> Int {
        return i & (-i)
    }
}

func countSmaller(_ nums: [Int]) -> [Int] {
    let nums = nums
    let sorted = Array(Set(nums)).sorted()
    let tree = FenwickTree(sorted.count)
    var map = [Int: Int]()

    for (idx, num) in sorted.enumerated() {
        map[num] = idx + 1
    }

    var res = Array(repeating: 0, count: nums.count)
    for i in stride(from: nums.count-1, to: -1, by: -1) {
        tree.update(map[nums[i]]!, 1)
        res[i] = tree.query(map[nums[i]]! - 1)
    }

    return res
}
