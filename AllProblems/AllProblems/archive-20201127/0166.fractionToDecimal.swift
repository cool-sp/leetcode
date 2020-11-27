//
//  0166.fractionToDecimal.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    if numerator == 0 { return "0" }
    if numerator < 0 && denominator > 0 || numerator > 0 && denominator < 0 {
        return "-" + fractionToDecimal(abs(numerator), abs(denominator))
    }

    let numerator = abs(numerator)
    let denominator = abs(denominator)

    var res = ""

    // the part of integer
    let integer = numerator / denominator
    res += String(integer)

    // the part of decimal
    // add the leading zeros at the beginning
    var mod = numerator % denominator
    if mod == 0 { return res }
    res += "."
    while(mod*10 < denominator) {
        res += "0"
        mod *= 10
    }

    var record = [Int: Int]()
    var decimal = [Character]()
    var modIdx = 0
    while(mod != 0) {
        while (mod*10 < denominator) {
            decimal.append("0")
            mod *= 10
            modIdx += 1
        }
        mod *= 10

        // repeat pattern detected
        if let idx = record[mod] {
            modIdx = idx
            break
        } else {
            record[mod] = modIdx
        }

        let valA = mod / denominator
        let valB = mod % denominator

        decimal.append(Character(String(valA)))
        modIdx += 1

        mod = valB
    }

    if mod == 0 {
        res += String(decimal)
    } else {
        let startIdx = record[mod]!
        res += String(decimal[0..<startIdx]) + "(" + String(decimal[startIdx..<decimal.count]) + ")"
    }

    return res
}
