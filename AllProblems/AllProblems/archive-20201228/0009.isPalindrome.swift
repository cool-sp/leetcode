//
//  0009.isPalindrome.swift
//  AllProblems
//
//  Created by liuning on 2020/12/8.
//

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 { return false }

    var arr = [Int]()
    var x = x
    while x != 0 {
        let mode = x % 10
        let next = x / 10
        arr.append(mode)
        x = next
    }

    var i = 0
    var j = arr.count - 1
    while i < j {
        if arr[i] != arr[j] { return false }
        i += 1
        j -= 1
    }

    return true
}
