//
//  numSquares.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/231/practical-application-queue/1371/

import Foundation

func numSquares(_ n: Int) -> Int {
    guard n >= 1 else { return 0}
    
    var record = [Int: Int]()

    let maxSquare = getMaxSquare(n)
    for i in 1...maxSquare {
        record[i*i] = 1
    }

    var arr = [n]
    return calculate(&arr, 0, &record)
}

private func getMaxSquare(_ n: Int) -> Int {
    var result = 0
    for i in 1...n {
        if i*i <= n { result = i }
    }
    return result
}


private func calculate(_ arr: inout [Int], _ offset: Int, _ record: inout [Int: Int]) -> Int {
    let oldCount = arr.count
    for num in arr[offset..<arr.count] {
        if let val = record[num] { return val }

        let maxSquare = getMaxSquare(num)
        for square in 1...maxSquare {
            arr.append(num - square*square)
        }
    }

    return calculate(&arr, oldCount, &record) + 1
}
