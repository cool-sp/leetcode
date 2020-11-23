//
//  0007.reverse.swift
//  AllProblems
//
//  Created by liuning on 2020/11/18.
//

import Foundation

func reverse(_ x: Int) -> Int {
    if !isValid(x) { return 0 }
    if x < 0 { return -reverse(-x) }

    var x = x
    var arr = [Int]()
    arr.append(0)
    while(x > 0) {
        arr.append(x % 10)
        x /= 10
    }

    var pow = powOfTen(arr.count-1)
    var result = 0
    for val in arr {
        result += val*pow
        pow /= 10
    }

    if isValid(result) { return result }
    else { return 0 }
}

private func powOfTen(_ k: Int) -> Int {
    var k = k
    var result = 1
    while(k > 0) {
        result *= 10
        k -= 1
    }
    return result
}

private func isValid(_ x: Int) -> Bool {
    if x < Int32.min || x > Int32.max { return false }
    return true
}
