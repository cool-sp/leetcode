//
//  0227.calculate.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation


func calculate(_ s: String) -> Int {
    var num: Int = 0
    var op = "+"
    var stack = [Int]()

    // appending the last char "+" to make sure last result could be pushed into stack
    for ch in s+"+" where ch != " " {
        if let number = ch.wholeNumberValue {
            num = num*10 + number
        } else {
            switch(op) {
            case "+": stack.append(num)
            case "-": stack.append(-num)
            case "*": stack.append(stack.removeLast() * num)
            case "/": stack.append(stack.removeLast() / num)
            default: break
            }

            num = 0
            op = String(ch)
        }
    }

    return stack.reduce(0, +)
}
