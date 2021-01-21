//
//  0273.numberToWords.swift
//  AllProblems
//
//  Created by liuning on 2020/12/30.
//

import Foundation

private let basicMap = [
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
    10: "Ten",
    11: "Eleven",
    12: "Twelve",
    13: "Thirteen",
    14: "Fourteen",
    15: "Fifteen",
    16: "Sixteen",
    17: "Seventeen",
    18: "Eighteen",
    19: "Nineteen",
    20: "Twenty",
    30: "Thirty",
    40: "Forty",
    50: "Fifty",
    60: "Sixty",
    70: "Seventy",
    80: "Eighty",
    90: "Ninety",
]

func numberToWords(_ num: Int) -> String {
    var res = [String]()

    var n = num/1000000000
    if n > 0 {
        res.append(contentsOf: hundredLevel(n))
        res.append("Billion")
    }

    n = (num%1000000000)/1000000
    if n > 0 {
        res.append(contentsOf: hundredLevel(n))
        res.append("Million")
    }

    n = (num%1000000)/1000
    if n > 0 {
        res.append(contentsOf: hundredLevel(n))
        res.append("Thousand")
    }

    n = num%1000
    if n > 0 {
        res.append(contentsOf: hundredLevel(n))
    }

    if res.isEmpty { return "Zero" }
    else { return res.joined(separator: " ") }
}

private func tenLevel(_ n: Int) -> [String] {
    var res = [String]()
    // ab
    let ab = n%100
    if ab > 0 {
        if let mapped = basicMap[ab] {
            res.append(mapped)
        } else {
            let a = ab/10
            let b = ab%10
            res.append(basicMap[a*10]!)
            res.append(basicMap[b]!)
        }
    }
    return res
}

private func hundredLevel(_ n: Int) -> [String] {
    let n = n % 1000
    var res = [String]()
    // abc
    // for a:
    let a = (n%1000)/100
    if a > 0 {
        res.append(basicMap[a]!)
        res.append("Hundred")
    }
    // for bc:
    let bc = n%100
    if bc > 0 {
        res.append(contentsOf: tenLevel(n))
    }

    return res
}
