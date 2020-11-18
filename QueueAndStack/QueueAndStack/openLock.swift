//
//  openLock.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/231/practical-application-queue/1375/

import Foundation

func openLock(_ deadends: [String], _ target: String) -> Int {
    var used = Set<String>(deadends)
    if used.contains(target) { return -1 }
    if used.contains("0000") { return -1 }
    if target == "0000" { return 0 }

    let curr = Set<String>(["0000"])
    var next = nextGroup(curr, &used)
    var cnt = 0
    while(!next.isEmpty) {
        cnt += 1
        if next.contains(target) { return cnt }
        else { next = nextGroup(next, &used) }
    }

    return -1
}

private func nextGroup(_ curr: Set<String>, _ used: inout Set<String>) -> Set<String> {
    var result = Set<String>()

    for str in curr {
        let lock = Array(str)
        for index in 0..<lock.count {
            let up = String(nextLock(lock, true, index))
            if !used.contains(up) {
                result.insert(up)
                used.insert(up)
            }

            let down = String(nextLock(lock, false, index))
            if !used.contains(down) {
                result.insert(down)
                used.insert(down)
            }
        }
    }

    return result
}

private func nextLock(_ lock: [Character], _ up: Bool, _ idx: Int) -> [Character] {
//    var result = lock
//
//    let digit = Int(String(lock[idx]))!
//    let nextDigit = up ? (digit+1)%10 : (digit+9)%10
//    let array = Range(0...9).map {Character(String($0))}
//    let nextChar = array[nextDigit]
//
//    result[idx] = nextChar
//    return result

    let replaced: Character
    if up {
        switch(lock[idx]) {
        case "0": replaced = "1"
        case "1": replaced = "2"
        case "2": replaced = "3"
        case "3": replaced = "4"
        case "4": replaced = "5"
        case "5": replaced = "6"
        case "6": replaced = "7"
        case "7": replaced = "8"
        case "8": replaced = "9"
        case "9": replaced = "0"
        default: replaced = "0"
        }
    } else {
        switch(lock[idx]) {
        case "0": replaced = "9"
        case "1": replaced = "0"
        case "2": replaced = "1"
        case "3": replaced = "2"
        case "4": replaced = "3"
        case "5": replaced = "4"
        case "6": replaced = "5"
        case "7": replaced = "6"
        case "8": replaced = "7"
        case "9": replaced = "8"
        default: replaced = "0"
        }
    }

    var result = lock
    result[idx] = replaced
    return result
}
