//
//  decodeString.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/239/conclusion/1379/

import Foundation

enum DSTYPE: Equatable {
    case DIG(Int)
    case STR(String)
    case LBR // [
    case RBR // ]
    case NONE
}

func decodeString(_ s: String) -> String {
    let s = Array(s)

    var stack = [(Int, String)]()
    stack.append((1, ""))

    var start = 0
    var (type, len) = read(s, start)
    while(type != .NONE) {
        switch(type) {
        case .DIG(let val):
            stack.append((val, ""))
        case .STR(let str):
            stack[stack.count-1].1 += str
        case .LBR:
            break
        case .RBR:
            let cnt = stack[stack.count-1].0
            let str = stack[stack.count-1].1
            let rpt = String(repeating: str, count: cnt)
            stack.removeLast()
            stack[stack.count-1].1 += rpt
        case .NONE:
            break
        }

        start = start + len
        (type, len) = read(s, start)
    }

    return stack.last!.1
}

private func read(_ s: [Character], _ start: Int) -> (DSTYPE, Int) {
    if start >= s.count { return (.NONE, 0) }

    if s[start] == "[" { return (.LBR, 1) }
    if s[start] == "]" { return (.RBR, 1) }

    if s[start].isNumber {
        var end = start + 1
        while(end < s.count && s[end].isNumber) {
            end += 1
        }
        return (.DIG(Int(String(s[start..<end]))!), end - start)
    }

    if s[start].isLetter {
        var end = start + 1
        while(end < s.count && s[end].isLetter) {
            end += 1
        }
        return (.STR(String(s[start..<end])), end - start)
    }

    return (.NONE, 0)
}
