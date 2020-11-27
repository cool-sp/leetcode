//
//  0190.reverseBits.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func reverseBits(_ n: Int) -> Int {
    // swap 16 bits first, then 8 bits, then 4 bits ...
    var n = (n << 16) | (n >> 16)
    n = ((n & 0x00ff00ff) << 8) | ((n & 0xff00ff00) >> 8)
    n = ((n & 0x0f0f0f0f) << 4) | ((n & 0xf0f0f0f0) >> 4)
    n = ((n & 0x33333333) << 2) | ((n & 0xcccccccc) >> 2)
    n = ((n & 0x55555555) << 1) | ((n & 0xaaaaaaaa) >> 1)
    return n

//    var str = String(n, radix: 2)
//    let leadingZeroCnt = 32 - str.count
//    str = String(Array(repeating: "0", count: leadingZeroCnt)) + str
//
//    let rev = String(str.reversed())
//    return Int(rev, radix: 2)!
}
