//
//  0032.longestValidParentheses.swift
//  AllProblems
//
//  Created by liuning on 2020/12/3.
//

import Foundation

func longestValidParentheses(_ s: String) -> Int {
    let s = Array(s)
    var stack = [Int]()
    stack.append(-1)

    var maxLen = 0
    for i in 0..<s.count {
        switch s[i] {
        case "(":
            stack.append(i)
        case ")":
            let strIdx = stack.last!
            if strIdx < 0 {
                stack.append(i)
            } else if s[strIdx] == "(" {
                stack.removeLast()
                maxLen = max(maxLen, i-stack.last!)
            } else {
                stack.append(i)
            }
        default: break
        }
    }
    return maxLen
}
