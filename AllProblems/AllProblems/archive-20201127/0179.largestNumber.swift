//
//  0179.largestNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func largestNumber(_ nums: [Int]) -> String {
    var strs = nums.map { String($0) }

    strs.sort { (strA, strB) -> Bool in
        return strA + strB > strB + strA
    }

    let joined = Array(strs.joined())

    if joined[0] == "0" { return "0" }
    else { return String(joined) }
}
