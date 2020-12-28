//
//  0060.getPermutation.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func getPermutation(_ n: Int, _ k: Int) -> String {
    var nums = [Int]()
    for i in 1...n {
        nums.append(i)
    }

    var path = [Int]()
    permutationHelper(nums, k-1, &path)

    let res = path.map { Character(String($0)) }
    return String(res)
}

private func permutationHelper(_ nums: [Int], _ kth: Int, _ path: inout [Int]) {
    let count = nums.count
    if count == 1 {
        path.append(nums[0])
        return
    }

    let groupCnt = getFactorial(count - 1)

    let div = kth / groupCnt
    let mod = kth % groupCnt

    path.append(nums[div])

    var nums = nums
    nums.remove(at: div)

    permutationHelper(nums, mod, &path)
}

private func getFactorial(_ n: Int) -> Int {
    var res = 1
    for i in 1...n {
        res *= i
    }
    return res
}
