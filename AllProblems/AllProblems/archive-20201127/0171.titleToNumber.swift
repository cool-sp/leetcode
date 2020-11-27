//
//  0171.titleToNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func titleToNumber(_ s: String) -> Int {
    let s = Array(s)

    var pow = 1
    var idx = s.count-1
    var res = 0
    while(idx >= 0) {
        res += toInt(s[idx])*pow
        pow *= 26
        idx -= 1
    }

    return res
}

private func toInt(_ ch: Character) -> Int {
    let ascii = Int(ch.unicodeScalars.first!.value)
    return ascii - 64 // 'A' is 65
}
