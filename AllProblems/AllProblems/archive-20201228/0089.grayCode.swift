//
//  0089.grayCode.swift
//  AllProblems
//
//  Created by liuning on 2020/12/11.
//

import Foundation

func grayCode(_ n: Int) -> [Int] {
    if n == 0 { return [0] }
    if n == 1 { return [0, 1] }

    var res = Array(repeating: 0, count: powOfTwo(n))
    res[0] = 0
    res[1] = 1

    var base = 1
    for _ in 1...n-1 {
        base = base*2
        let tail = base - 1

        var offset = 0
        let start = tail + 1
        for j in stride(from: tail, to: -1, by: -1) {
            res[start + offset] = base + res[j]
            offset += 1
        }
    }

    return res
}

private func powOfTwo(_ k: Int) -> Int {
    if k <= 0 { return 1 }

    var res = 1
    for _ in 1...k {
        res = res * 2
    }
    return res
}
