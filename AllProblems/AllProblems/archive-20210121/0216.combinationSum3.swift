//
//  0216.combinationSum3.swift
//  AllProblems
//
//  Created by liuning on 2020/12/28.
//

import Foundation

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var res = [[Int]]()
    combineHelper(k, n, 1, [], &res)
    return res
}

private func combineHelper(_ k: Int, _ n: Int, _ min: Int, _ path: [Int], _ res: inout [[Int]]) {
    guard k > 0 else { return }
    guard min <= 9 else { return }
    guard n > 0 else { return }
    guard n > min else { return }

    if k == 1 {
        let pathSum = path.reduce(0, +)
        let val = n - pathSum
        if val >= min && val <= 9 {
            res.append(path + [val])
        }
        return
    }

    var i = min
    while i < Swift.min(n, 9) {
        if n-i > 0 {
            combineHelper(k-1, n, i+1, path + [i], &res)
        }
        i += 1
    }
}
