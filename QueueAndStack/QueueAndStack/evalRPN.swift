//
//  evalRPN.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/230/usage-stack/1394/

import Foundation

enum TYPE {
    case Digit(Int)
    case Plus
    case Minus
    case Div
    case Multiply
}

func evalRPN(_ tokens: [String]) -> Int {
    var val = 0
    var stack = [Int]()

    for token in tokens {
        let tk = parse(token)

        switch(tk) {
        case .Digit(let val):
            stack.append(val)
        case .Plus:
            val = stack[stack.count-2] + stack[stack.count-1]
            stack.removeLast(2)
            stack.append(val)
        case .Minus:
            val = stack[stack.count-2] - stack[stack.count-1]
            stack.removeLast(2)
            stack.append(val)
        case .Div:
            val = stack[stack.count-2] / stack[stack.count-1]
            stack.removeLast(2)
            stack.append(val)
        case .Multiply:
            val = stack[stack.count-2] * stack[stack.count-1]
            stack.removeLast(2)
            stack.append(val)
        }
    }

    if stack.isEmpty { return 0 }
    else { return stack.last! }
}

private func parse(_ str: String) -> TYPE {
    if str.starts(with: "+") && str.count == 1 {
        return .Plus
    } else if str.starts(with: "-") && str.count == 1 {
        return .Minus
    } else if str.starts(with: "/") {
        return .Div
    } else if str.starts(with: "*") {
        return .Multiply
    } else {
        return .Digit(Int(str)!)
    }
}
