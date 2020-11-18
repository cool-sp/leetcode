//
//  dailyTemperatures.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/230/usage-stack/1363/

import Foundation

func dailyTemperatures(_ T: [Int]) -> [Int] {
    if T.count <= 0 { return [] }

    var result = Array(repeating: 0, count: T.count)

    var stack = [(Int, Int)]()
    for idx in 0..<T.count {
        while(!stack.isEmpty && stack.last!.0 < T[idx]) {
            let prevIdx = stack.last!.1
            result[prevIdx] = idx - prevIdx
            stack.removeLast()
        }

        stack.append((T[idx], idx))
    }

    return result
}
