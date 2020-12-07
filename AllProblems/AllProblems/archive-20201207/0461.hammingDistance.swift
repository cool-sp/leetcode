//
//  0461.hammingDistance.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    return calculateBitOne(x^y)
}

private func calculateBitOne(_ k: Int) -> Int {
    var count = 0
    var k = k
    while k != 0 {
        k &= k - 1
        count += 1
    }

    return count
}
