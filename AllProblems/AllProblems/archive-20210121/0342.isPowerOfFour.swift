//
//  0342.isPowerOfFour.swift
//  AllProblems
//
//  Created by liuning on 2021/1/10.
//

import Foundation

func isPowerOfFour(_ n: Int) -> Bool {
    return n > 0 && n & (n-1) == 0 && n & 0xaaaaaaaa == 0
}
