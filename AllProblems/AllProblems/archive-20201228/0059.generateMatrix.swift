//
//  0059.generateMatrix.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func generateMatrix(_ n: Int) -> [[Int]] {
    var L = 0
    var R = n - 1
    var T = 0
    var B = n - 1
    var res = Array(repeating: Array(repeating: 0, count: n), count: n)

    var cnt = 1
    let max = n*n
    while cnt <= max {
        for i in stride(from: L, to: R+1, by: +1) { res[T][i] = cnt; cnt += 1 }
        T += 1
        for i in stride(from: T, to: B+1, by: +1) { res[i][R] = cnt; cnt += 1 }
        R -= 1
        for i in stride(from: R, to: L-1, by: -1) { res[B][i] = cnt; cnt += 1 }
        B -= 1
        for i in stride(from: B, to: T-1, by: -1) { res[i][L] = cnt; cnt += 1 }
        L += 1
    }

    return res
}

//func generateMatrix(_ n: Int) -> [[Int]] {
//    var res = Array(repeating: Array(repeating: 0, count: n), count: n)
//
//    // left -> down -> right -> up
//    let direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]
//    var minR = 0
//    var maxR = n
//    var minC = -1
//    var maxC = n
//
//    var p = (0, 0)
//    var curr = 0
//    var val = 1
//    while(val <= n*n) {
//        let r = p.0
//        let c = p.1
//        res[r][c] = val
//
//        curr = getNextDirection(&minR, &maxR, &minC, &maxC, r, c, curr)
//        let nextR = r + direction[curr].0
//        let nextC = c + direction[curr].1
//        p = (nextR, nextC)
//
//        val += 1
//    }
//
//    return res
//}
//
//private func getNextDirection(_ minR: inout Int,
//                              _ maxR: inout Int,
//                              _ minC: inout Int,
//                              _ maxC: inout Int,
//                              _ r: Int,
//                              _ c: Int,
//                              _ direction: Int) -> Int {
//    switch direction {
//    case 0: // left
//        if c + 1 < maxC {
//            if c + 1 == maxC - 1 { maxC = maxC - 1 }
//            return 0
//        } else { fallthrough }
//    case 1: // down
//        if r + 1 < maxR {
//            if r + 1 == maxR - 1 { maxR = maxR - 1 }
//            return 1
//        } else { fallthrough }
//    case 2: // right
//        if c - 1 > minC {
//            if c - 1 == minC + 1 { minC = minC + 1 }
//            return 2
//        } else { fallthrough }
//    case 3: // up
//        if r - 1 > minR {
//            if r - 1 == minR + 1 { minR = minR + 1 }
//            return 3
//        } else { return 0 }
//    default: return 0
//    }
//}

