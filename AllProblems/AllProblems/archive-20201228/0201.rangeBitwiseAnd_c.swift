//
//  0201.rangeBitwiseAnd.swift
//  AllProblems
//
//  Created by liuning on 2020/12/27.
//

import Foundation

func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
    var n = n
    while n > m {
        n &= n-1
    }

    return n
}
