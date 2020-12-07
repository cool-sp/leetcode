//
//  0326.isPowerOfThree.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

func isPowerOfThree(_ n: Int) -> Bool {
    if n < 1 { return false }
    if n == 1 { return true }
    if n % 3 != 0 { return false }
    return isPowerOfThree(n/3)
}
