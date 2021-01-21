//
//  0224.calculate.swift
//  AllProblems
//
//  Created by liuning on 2020/12/28.
//

import Foundation

func calculate224(_ s: String) -> Int {
    let s = Array(s)
    let (number, _) = helper(s, 0)
    return number
}

private func helper(_ s: [Character], _ offset: Int) -> (Int, Int) {
    var prevNumber = 0
    var currNumber = 0
    var op: Character = "+"
    var shouldReturn = false

    var i = offset
    while i < s.count && !shouldReturn {
        // accumuate the numbers first ...
        if s[i].isNumber {
            currNumber = currNumber*10 + Int(String(s[i]))!
            i += 1
            continue
        }

        // if it's not a digit, then we will do the pending calculation
        if op == "+" {
            prevNumber += currNumber
        } else {
            prevNumber -= currNumber
        }
        currNumber = 0

        // for the next round calculation
        if s[i] == "+" || s[i] == "-" {
            op = s[i]
        } else if s[i] == ")" {
            shouldReturn = true
        } else if s[i] == "(" {
            let (number, idx) = helper(s, i+1)
            currNumber = number
            i = idx - 1
        }
        i += 1
    }

    if op == "+" {
        prevNumber += currNumber
    } else {
        prevNumber -= currNumber
    }

    return (prevNumber, i)
}
