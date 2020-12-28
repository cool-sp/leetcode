//
//  0012.intToRoman.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func intToRoman(_ num: Int) -> String {
    var num = num
    var str = ""
    var res = ""

    while num > 0 {
        (num, str) = consume(num)
        res += str
    }

    return res
}

private func consume(_ val: Int) -> (Int, String) {
    var str = ""
    var root = 1
    switch val {
    case 1: str = "I"; root = 1
    case 2: str = "II"; root = 2
    case 3: str = "III"; root = 3
    case 4: str = "IV"; root = 4
    case 5..<9: str = "V"; root = 5
    case 9: str = "IX"; root = 9
    case 10..<40: str = "X"; root = 10
    case 40..<50: str = "XL"; root = 40
    case 50..<90: str = "L"; root = 50
    case 90..<100: str = "XC"; root = 90
    case 100..<400: str = "C"; root = 100
    case 400..<500: str = "CD"; root = 400
    case 500..<900: str = "D"; root = 500
    case 900..<1000: str = "CM"; root = 900
    case 1000...Int.max: str = "M"; root = 1000
    default: break
    }

    return (val - root, str)
}
