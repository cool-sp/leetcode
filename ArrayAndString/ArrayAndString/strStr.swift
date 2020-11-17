//
//  strStr.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/203/introduction-to-string/1161/

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.count <= 0 { return 0 }
    if needle.count > haystack.count { return -1 }

    let haystack = Array(haystack)
    let needle = Array(needle)

    var i = 0
    while(i < haystack.count-needle.count+1) {
        var temp = i
        var j = 0
        while(j < needle.count) {
            if haystack[temp] == needle[j] {
                j = j + 1
                temp = temp + 1
            } else {
                break
            }
        }

        if j == needle.count { return i }
        i += 1
    }

    return -1
}
