//
//  0438.findAnagrams.swift
//  AllProblems
//
//  Created by liuning on 2020/12/4.
//

import Foundation

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    let s = s.map { charToInt($0) }
    let p = p.map { charToInt($0) }

    var window = Array(repeating: 0, count: 26)
    var pattern = Array(repeating: 0, count: 26)
    for v in p { pattern[v] += 1 }

    var res = [Int]()

    for i in 0..<s.count {
        window[s[i]] += 1

        if i >= p.count {
            window[s[i-p.count]] -= 1
        }

        if window == pattern {
            res.append(i-p.count+1)
        }
    }

    return res
}

private func charToInt(_ ch: Character) -> Int {
    return Int(ch.asciiValue!) - Int(Character("a").asciiValue!)
}

//class Context {
//    var bak = [Character: Int]()
//    var map = [Character: Int]()
//    var appear = [Character: Int]()
//
//    init(_ pattern: String) {
//        for ch in pattern {
//            map[ch, default:0] += 1
//        }
//        bak = map
//    }
//
//    func reset() {
//        map = bak
//        appear.removeAll()
//    }
//
//    func remove(_ ch: Character) {
//        map[ch]! -= 1
//    }
//
//    func match(_ ch: Character, _ idx: Int) -> (Int, Bool) {
//        if let cnt = map[ch] {
//            if cnt > 0 {
//                map[ch]! -= 1
//                if appear[ch] == nil {
//                    appear[ch] = idx
//                }
//                return (appear[ch]!, true)
//            }
//            return (appear[ch]!, false)
//        }
//        return (-1, false)
//    }
//}
//
//func findAnagrams(_ s: String, _ p: String) -> [Int] {
//    if s.count <= 0 { return [] }
//    if p.count <= 0 { return [] }
//    if s.count < p.count { return [] }
//
//    var res = [Int]()
//    let s = Array(s)
//    let context = Context(p)
//
//    var i = 0
//    while i <= s.count-p.count {
//        var matchCnt = 0
//        var j = i
//        var restartIdx = 0
//        while j < i+p.count {
//            let (firstApper, ok) = context.match(s[j], j)
//            if ok {
//                matchCnt += 1
//            } else {
//                restartIdx = firstApper
//                break
//            }
//            j += 1
//        }
//
//        if matchCnt == p.count {
//            res.append(i)
//            i += 1
//        } else {
//            if restartIdx < 0 {
//                i = j + 1
//            } else {
//                i = restartIdx + 1
//            }
//        }
//        context.reset()
//    }
//
//    return res
//}
