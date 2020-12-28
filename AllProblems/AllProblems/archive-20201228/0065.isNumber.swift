//
//  0065.isNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

// https://leetcode-cn.com/problems/valid-number/solution/biao-qu-dong-fa-by-user8973/
func isNumber(_ s: String) -> Bool {
    let DFA = [
        [ 0, 1, 6, 2,-1],
        [-1,-1, 6, 2,-1],
        [-1,-1, 3,-1,-1],
        [ 8,-1, 3,-1, 4],
        [-1, 7, 5,-1,-1],
        [ 8,-1, 5,-1,-1],
        [ 8,-1, 6, 3, 4],
        [-1,-1, 5,-1,-1],
        [ 8,-1,-1,-1,-1]
    ]

    let validTerminationState = [3, 5, 6, 8]

    let s = Array(s)
    var state = 0
    for ch in s {
        let idx = convertInputChar(ch)
        if idx < 0 { return false }

        state = DFA[state][idx]
        if state < 0 { return false }
    }

    return validTerminationState.contains(state)
}

private func convertInputChar(_ ch: Character) -> Int {
    switch ch {
    case " ": return 0
    case "+": return 1
    case "-": return 1
    case "0"..."9": return 2
    case ".": return 3
    case "e": return 4
    default: return -1
    }
}
