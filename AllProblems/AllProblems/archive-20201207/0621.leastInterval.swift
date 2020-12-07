//
//  0621.leastInterval.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var map = [Character: Int]()
    for task in tasks {
        map[task,default:0] += 1
    }

    var freq = [(Character, Int)]()
    for (ch, count) in map {
        freq.append((ch, count))
    }
    freq.sort(by: {$0.1 > $1.1})

    let (_, mostFreqCnt) = freq[0]
    var idleSlotCnt = (mostFreqCnt - 1) * n

    var additionalSlot = 0
    var idx = 1
    while idx < freq.count {
        let currFreqCnt = freq[idx].1
        if currFreqCnt >= mostFreqCnt {
            additionalSlot += 1
            idleSlotCnt -= currFreqCnt - 1
        } else {
            idleSlotCnt -= currFreqCnt
        }

        if idleSlotCnt <= 0 { return tasks.count }

        idx += 1
    }

    return (mostFreqCnt - 1) * n + mostFreqCnt + additionalSlot
}
