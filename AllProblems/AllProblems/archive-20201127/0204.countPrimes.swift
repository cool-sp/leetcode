//
//  0204.countPrimes.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func countPrimes(_ n: Int) -> Int {
    if n <= 1 { return 0 }

    var arr = Array(repeating: true, count: n+1)
    arr[0] = false
    arr[1] = false

    var count = 0
    for i in 2..<n {
        if !arr[i] { continue }
        else { count += 1 }

        for j in stride(from: i, to: n, by: i) {
            arr[j] = false
        }
    }

    return count
}
