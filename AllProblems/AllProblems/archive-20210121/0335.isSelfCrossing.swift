//
//  0335.isSelfCrossing.swift
//  AllProblems
//
//  Created by liuning on 2021/1/10.
//

import Foundation

// https://leetcode-cn.com/problems/self-crossing/solution/lu-jing-jiao-cha-hua-dong-chuang-kou-jie-fa-by-hzh/

func isSelfCrossing(_ x: [Int]) -> Bool {
    if x.count <= 3 { return false }

    let x = [0,0] + x
    var idx = 0
    while idx < x.count - 5 {
        let a = x[idx+0]
        let b = x[idx+1]
        let c = x[idx+2]
        let d = x[idx+3]
        let e = x[idx+4]
        let f = x[idx+5]

        if e < c - a && f > d {
            return true
        }

        if e >= c - a && e <= c {
            if d < b && f > d { return true }
            if d >= b && f >= d - b { return true }
        }

        idx += 1
    }

    return false
}
