//
//  0040.combinationSum2.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted()
    var res = [[Int]]()
    combineHelper(candidates, 0, target, [], &res)
    return res
}

private func combineHelper(_ candidates: [Int],
                           _ index: Int,
                           _ target: Int,
                           _ combines: [Int],
                           _ res: inout [[Int]]) {

    if index >= candidates.count { return }

    var preVal = Int.min
    for i in index..<candidates.count {
        if target < candidates[i] { return }
        if candidates[i] <= preVal { continue }
        preVal = candidates[i]

        var newCombines = combines
        newCombines.append(candidates[i])
        if target > candidates[i] {
            combineHelper(candidates, i+1, target-candidates[i], newCombines, &res)
        } else {
            res.append(newCombines)
        }
    }
}
