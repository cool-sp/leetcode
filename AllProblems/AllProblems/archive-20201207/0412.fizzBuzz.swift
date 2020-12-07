//
//  0412.fizzBuzz.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

func fizzBuzz(_ n: Int) -> [String] {
    guard n >= 1 else { return [] }

    var result = [String]()
    for i in 1...n {
        if i % 15 == 0 {
            result.append("FizzBuzz")
        } else if i % 3 == 0 {
            result.append("Fizz")
        } else if i % 5 == 0 {
            result.append("Buzz")
        } else {
            result.append(String(i))
        }
    }

    return result
}
