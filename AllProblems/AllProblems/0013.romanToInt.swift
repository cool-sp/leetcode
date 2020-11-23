//
//  0013.romanToInt.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func romanToInt(_ s: String) -> Int {
    var pos = 0
    var val = 0
    let s = Array(s)

    var next = read(s, &pos)
    while(next != nil) {
        val += next!
        next = read(s, &pos)
    }

    return val
}

private func read(_ s: [Character], _ pos: inout Int) -> Int? {
    if pos >= s.count { return nil}

    var val = 0
    if pos == s.count - 1 {
        val = convert(s[pos])
    } else {
        switch((s[pos], s[pos+1])) {
        case ("I", "V"): fallthrough
        case ("I", "X"): fallthrough
        case ("X", "L"): fallthrough
        case ("X", "C"): fallthrough
        case ("C", "D"): fallthrough
        case ("C", "M"): val = -convert(s[pos])
        default: val = convert(s[pos])
        }
    }

    pos += 1
    return val
}

private func convert(_ ch: Character) -> Int {
    switch(ch) {
    case "I": return 1
    case "V": return 5
    case "X": return 10
    case "L": return 50
    case "C": return 100
    case "D": return 500
    case "M": return 1000
    default: return 0
    }
}
