//
//  0008.myAtoi.swift
//  AllProblems
//
//  Created by liuning on 2020/11/18.
//

import Foundation

func myAtoi(_ s: String) -> Int {
    if s.isEmpty { return 0 }

    let s = Array(s)
    var pos = 0
    var minus = false

    // skip space
    while(pos < s.count && s[pos] == " ") {
        pos += 1
    }
    if pos >= s.count { return 0 }

    // handle minus
    if s[pos] == "+" {
        minus = false
        pos += 1
        if pos >= s.count { return 0 }
    } else if s[pos] == "-" {
        minus = true
        pos += 1
        if pos >= s.count { return 0 }
    } else if !s[pos].isNumber {
        return 0
    }

    // handle number
    let start = pos
    while(pos < s.count && s[pos].isNumber) {
        pos += 1
    }
    if pos == start { return 0 }

    if var number = Int(String(s[start..<pos])) {
        if minus {
            number = -number
        }

        return convert(number)
    }

    if minus { return Int(Int32.min) }
    else { return Int(Int32.max) }
}

private func isValid(_ x: Int) -> Bool {
    if x < Int32.min || x > Int32.max { return false }
    return true
}

private func convert(_ x: Int) -> Int {
    if x < Int32.min {
        return Int(Int32.min)
    } else if x > Int32.max {
        return Int(Int32.max)
    }
    return x
}
