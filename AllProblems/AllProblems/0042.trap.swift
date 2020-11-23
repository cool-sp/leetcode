//
//  0042.trap.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func trap(_ height: [Int]) -> Int {
    if height.count <= 0 { return 0 }

    var waiting = [(Int, Int, Int)]()
    var result = 0

    var prev = 0
    for curr in 1..<height.count {
        if height[curr] == height[prev] {
            continue
        } else if height[curr] < height[prev] {
            let diff = height[prev] - height[curr]
            waiting.append((curr, height[curr], diff))
            prev = curr
        } else {
            while(!waiting.isEmpty) {
                let last = waiting.last!
                if height[curr] >= last.1 + last.2 {
                    result += (curr - last.0) * last.2
                    waiting.removeLast()
                } else if height[curr] < last.1 + last.2 {
                    result += (curr - last.0) * (height[curr] - last.1)
                    let lastIdx = waiting.count - 1
                    waiting[lastIdx].1 = height[curr]
                    waiting[lastIdx].2 = last.1 + last.2 - height[curr]
                    break
                }
            }
            prev = curr
        }
    }

    return result
}
