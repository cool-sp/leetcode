//
//  0231.isPowerOfTwo.swift
//  AllProblems
//
//  Created by liuning on 2020/12/29.
//

import Foundation

func isPowerOfTwo(_ n: Int) -> Bool {
    if n <= 0 { return false }
    return n&(n-1) == 0
}
