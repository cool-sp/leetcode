//
//  0039.combinationSum.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted()
    var res = [[Int]]()
    combineSum(candidates, target, [], &res)

    return res
}

private func findFirstLarge(_ candidates: [Int], _ target: Int) -> Int {
    var lft = 0
    var rht = candidates.count - 1

    while lft <= rht {
        let mid = lft + (rht - lft) / 2
        if candidates[mid] <= target {
            lft = mid + 1
        } else {
            rht = mid - 1
        }
    }
    return lft
}

private func combineSum(_ candidates: [Int], _ target: Int, _ curCombines: [(Int, Int)], _ res: inout [[Int]]) {
    if candidates.isEmpty { return }
    let firstLarge = findFirstLarge(candidates, target)
    if firstLarge <= 0 { return }

    for i in 0..<firstLarge {
        let times = target / candidates[i]
        for time in 1...times {
            let remaining = target - time*candidates[i]
            var combines = curCombines
            combines.append((candidates[i], time))

            if remaining == 0 {
                updateResult(combines, &res)
            } else {
                combineSum(Array(candidates[i+1..<candidates.count]), remaining, combines, &res)
            }
        }
    }
}

private func updateResult(_ combines: [(Int, Int)], _ res: inout [[Int]]) {
    var temp = [Int]()
    for e in combines {
        let subarr = Array(repeating: e.0, count: e.1)
        temp.append(contentsOf: subarr)
    }
    res.append(temp)
}
