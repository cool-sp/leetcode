//
//  generate.swift
//  ArrayAndString
//
//  Created by liuning on 2020/11/16.
//

// https://leetcode.com/explore/learn/card/array-and-string/202/introduction-to-2d-array/1170/

import Foundation

func generate(_ numRows: Int) -> [[Int]] {
    if numRows <= 0 { return [] }

    var result = [[Int]]()
    result.append([1])

    var cnt = numRows - 1
    while(cnt > 0) {
        let r = numRows - cnt
        var arr = [Int]()
        for i in 0..<r+1 {
            arr.append(getVal(result[r-1], i-1) + getVal(result[r-1], i))
        }
        result.append(arr)

        cnt -= 1
    }

    return result
}

private func getVal(_ arr: [Int], _ i: Int) -> Int {
    if i < 0 { return 0 }
    if i >= arr.count { return 0 }

    return arr[i]
}
