//
//  0191.hammingWeight.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation

func hammingWeight(_ n: Int) -> Int {
    var n = n

    n = ((n & 0xaaaaaaaa) >> 1)  + (n & 0x55555555)
    n = ((n & 0xcccccccc) >> 2)  + (n & 0x33333333)
    n = ((n & 0xf0f0f0f0) >> 4)  + (n & 0x0f0f0f0f)
    n = ((n & 0xff00ff00) >> 8)  + (n & 0x00ff00ff)
    n = ((n & 0xffff0000) >> 16) + (n & 0x0000ffff)

    return n
}
