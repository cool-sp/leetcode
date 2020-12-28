//
//  0168.convertToTitle.swift
//  AllProblems
//
//  Created by liuning on 2020/12/25.
//

import Foundation

func convertToTitle(_ n: Int) -> String {
    var res = ""
    var n = n

    // number = ... + n*pow(26,2) + m*pow(26,1) + p*pow(26,0)
    // 1 <= n <= 26
    // 1 <= m <= 26
    // 1 <= p <= 26

    while n > 0 {
        let mod = (n-1)%26
        res += getMapped(mod)
        n = (n-1)/26
    }

    return String(res.reversed())
}

private func getMapped(_ val: Int) -> String {
    let asciiVal = Character("A").asciiValue! + UInt8((val)%26)
    return String(Character(UnicodeScalar(asciiVal)))
}
