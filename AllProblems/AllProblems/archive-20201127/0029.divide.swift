//
//  0029.divide.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    let r1 = div(dividend, divisor)
    let r2 = truncate(r1)
    return r2
}

private func div(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend < 0 && divisor < 0 { return div(-dividend, -divisor) }
    if dividend < 0 { return -div(-dividend, divisor) }
    if divisor < 0 { return -div(dividend, -divisor) }
    if divisor == 1 { return dividend }

    return times(divisor, dividend)
}

private func times(_ x: Int, _ target: Int) -> Int {
    if x > target { return 0 }

    var val = x
    var cnt = 1
    var preVal = val
    var preCnt = cnt
    while(val <= target) {
        preVal = val
        preCnt = cnt
        val += val
        cnt += cnt
    }

    let remaining = target - preVal
    preCnt += times(x, remaining)

    return preCnt
}

private func truncate(_ n: Int) -> Int {
    if n < Int32.min { return Int(Int32.min) }
    if n > Int32.max { return Int(Int32.max) }
    return n
}
