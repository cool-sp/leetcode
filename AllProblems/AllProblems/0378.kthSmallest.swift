//
//  0378.kthSmallest.swift
//  AllProblems
//
//  Created by liuning on 2020/12/2.
//

import Foundation

func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
    let N = matrix.count
    var idxArray = Array(repeating: 0, count: N)

    var L = matrix[0][0]
    var R = matrix[N-1][N-1]
    while L <= R {
        let M = (L + R) / 2
        let count = countSmaller(matrix, &idxArray, M)
        if count < k {
            L = M + 1
        } else if count >= k {
            R = M - 1
        }
    }

    return L
}

private func findSmaller(_ arr: [Int], _ target: Int) -> Int {
    var lft = 0
    var rht = arr.count - 1
    while lft <= rht {
        let mid = lft + (rht - lft) / 2
        if target < arr[mid] {
            rht = mid - 1
        } else {
            lft = mid + 1
        }
    }
    return lft
}

private func countSmaller(_ matrix: [[Int]], _ idxArray: inout [Int], _ target: Int) -> Int {
    for i in 0..<matrix.count {
        idxArray[i] = findSmaller(matrix[i], target)
    }
    return idxArray.reduce(0, +)
}
