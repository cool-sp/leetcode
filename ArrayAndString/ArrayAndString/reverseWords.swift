//
//  reverseWords.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/204/conclusion/1164/

import Foundation

func reverseWords(_ s: String) -> String {
    if s.count <= 0 { return "" }

    var s = Array(s)
    reverse(&s, 0, s.count-1)

    var charStart = firstSpaceLength(s, 0)
    var remaining = s.count - charStart
    while(remaining > 0) {
        let charLen = firstStringLength(s, charStart)
        reverse(&s, charStart, charStart + charLen - 1)
        remaining -= charLen

        let spaceLen = firstSpaceLength(s, charStart + charLen)
        charStart = charStart + charLen + spaceLen
        remaining -= spaceLen
    }

    let newLen = trimSpace(&s)
    return String(s[0..<newLen])
}

private func reverse(_ arr: inout [Character], _ from: Int, _ to: Int) {
    var from = from
    var to = to

    while(from <= to) {
        let temp = arr[from]
        arr[from] = arr[to]
        arr[to] = temp

        from += 1
        to -= 1
    }
}

private func firstSpaceLength(_ arr: [Character], _ from: Int) -> Int {
    var from = from
    var count = 0
    while(from < arr.count) {
        if arr[from] == " " { count += 1 ; from += 1 }
        else { break }
    }
    return count
}

private func firstStringLength(_ arr: [Character], _ from: Int) -> Int {
    var from = from
    var count = 0
    while(from < arr.count) {
        if arr[from] != " " { count += 1 ; from += 1 }
        else { break }
    }
    return count
}

private func trimSpace(_ arr: inout [Character]) -> Int {
    var i = 0
    var j = 0

    while(j < arr.count) {
        if arr[j] == " " {
            if j - 1 >= 0 && arr[j-1] != " " {
                arr[i] = arr[j]
                i += 1
                j += 1
            } else {
                j += 1
            }
        } else {
            arr[i] = arr[j]
            i += 1
            j += 1
        }
    }

    if arr[i-1] == " " { return i-1 }
    else { return i }
}
