//
//  0076.minWindow.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    // the basic idea here is to maintain a "sliding window"
    // the minimal length of the window is the result string
    // use the concept "distance" to judge whether the window contains
    // all the chars in the target string
    // distance == targetDistance when all the target chares are contained
    // in the string, even if more count of target chars are contained,
    // distance still equal to targetDistance
    // We slide the right edge of the window first, make sure
    // distance == targetDistance
    // then move the left edge of the window, find the minimal area
    // meets distance == targetDistance

    if s.count <= 0 { return "" }
    if t.count <= 0 { return s }
    if s.count < t.count { return "" }

    var windowFreq = [Character: Int]()
    let targetFreq = buildFreq(t)
    let s = Array(s)
    let t = Array(t)

    let targetDistance = t.count
    var currdistance = 0

    var left = 0
    var right = 0
    var minLen = Int.max
    var minPos = (-1, -1)
    while(true) {
        // move the right edge of window
        // make sure all the target chars are contained in the window
        while(right <= s.count && currdistance < targetDistance) {
            right += 1
            if right <= s.count {
                updateDistanceWhenAddChar(&windowFreq, targetFreq, &currdistance, s[right-1])
            }
        }

        if right > s.count { break }

        var prevLeft = left
        while(currdistance >= targetDistance) {
            updateDistanceWhenRemoveChar(&windowFreq, targetFreq, &currdistance, s[left])
            prevLeft = left
            left += 1
        }

        if right - prevLeft < minLen {
            minLen = right - prevLeft
            minPos = (prevLeft, right)
        }

        // kick another round of check
        // note when code reaches here, currdistance < targetDistance already
    }

    if minLen == Int.max {
        return ""
    } else {
        return String(s[minPos.0..<minPos.1])
    }
}

private func buildFreq(_ str: String) -> [Character: Int] {
    var result = [Character: Int]()
    for ch in str {
        result[ch, default:0] += 1
    }
    return result
}

private func updateDistanceWhenAddChar(_ windowFreq: inout [Character: Int],
                                       _ targetFreq: [Character: Int],
                                       _ currentDistance: inout Int,
                                       _ toBeAdded: Character) {
    // the char to be added is not in the target string
    if targetFreq[toBeAdded] == nil { return }

    let tFeq = targetFreq[toBeAdded]!
    windowFreq[toBeAdded, default:0] += 1
    if windowFreq[toBeAdded]! <= tFeq {
        currentDistance += 1
    }
}

private func updateDistanceWhenRemoveChar(_ windowFreq: inout [Character: Int],
                                           _ targetFreq: [Character: Int],
                                           _ currentDistance: inout Int,
                                           _ toBeRemoved: Character) {
    // the char to be removed is not in the target string
    if targetFreq[toBeRemoved] == nil { return }

    let tFeq = targetFreq[toBeRemoved]!
    windowFreq[toBeRemoved]! -= 1
    if windowFreq[toBeRemoved]! < tFeq {
        currentDistance -= 1
    }
}
