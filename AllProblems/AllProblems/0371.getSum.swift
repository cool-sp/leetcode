//
//  0371.getSum.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

func getSum(_ a: Int, _ b: Int) -> Int {
    if a == 0 { return b }
    if b == 0 { return a }

    var a = a
    var b = b
    var low = 0
    var car = 0
    while(true) {
        low = a ^ b
        car = a & b
        if car == 0 { break }
        a = low
        b = car << 1
    }

    return low
}
