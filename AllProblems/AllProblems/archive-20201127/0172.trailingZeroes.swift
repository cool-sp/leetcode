//
//  0172.trailingZeroes.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func trailingZeroes(_ n: Int) -> Int {
    var n = n, result = 0

    // n/5 + n/25 + n/125
    // actually it is just counting '5'
    while(n>0) {
        let temp = n/5
        result += temp
        n = temp
    }
    return result
}
