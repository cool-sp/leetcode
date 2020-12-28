//
//  0058.lengthOfLastWord.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func lengthOfLastWord(_ s: String) -> Int {
    let s = Array(s)

    var p = -1
    var q = 0
    var res = 0
    for i in 0..<s.count {
        if s[i] == " " {
            p = i
        } else {
            q = i
        }
        if q > p {
            res = q - p
        }
    }

    return res
}
