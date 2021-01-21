//
//  gcd.swift
//  AllProblems
//
//  Created by liuning on 2020/12/30.
//

import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    // gcd(a, b) = gcd(b, a mode b)
    var a = a
    var b = b
    while b != 0 {
        let t = b
        b = a % b
        a = t
    }

    return a
}
