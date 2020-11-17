//
//  addBinary.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/203/introduction-to-string/1160/

import Foundation

func addBinary(_ a: String, _ b: String) -> String {
    if a.count > b.count { return addBinary(b, a) }

    var arrayA = Array(Array(a).reversed())
    var arrayB = Array(Array(b).reversed())

    var carryover = 0
    for i in 0..<b.count {
        let valA = i < a.count ? arrayA[i] : "0"
        let sum = toInt(valA) + toInt(arrayB[i]) + carryover
        arrayB[i] = toChar(sum % 2)
        carryover = sum / 2
    }

    if carryover > 0 {
        arrayB.append("1")
    }

    return String(arrayB.reversed())
}

private func toInt(_ ch: Character) -> Int {
    if ch == "1" { return 1 }
    else { return 0 }
}

private func toChar(_ val: Int) -> Character {
    return Character(String(val))
}
