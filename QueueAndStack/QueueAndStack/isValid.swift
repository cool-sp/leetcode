//
//  isValid.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/230/usage-stack/1361/

import Foundation

func isValid(_ s: String) -> Bool {
    if s.isEmpty { return true }
    var stack = [Character]()

    for ch in s {
        if needPush(ch) {
            stack.append(ch)
        } else {
            let exp = expect(ch)
            if !stack.isEmpty && stack.last! == exp {
                stack.removeLast()
            } else {
                return false
            }
        }
    }

    return stack.isEmpty
}

private func needPush(_ ch: Character) -> Bool {
    return ch == "(" || ch == "[" || ch == "{"
}

private func expect(_ ch: Character) -> Character {
    switch(ch) {
    case ")": return "("
    case "]": return "["
    case "}": return "{"
    default: return "("
    }
}
