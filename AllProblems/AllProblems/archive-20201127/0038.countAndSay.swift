//
//  0038.countAndSay.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func countAndSay(_ n: Int) -> String {
    guard n >= 1 else { return "" }

    var idx = 1
    var str = "1"

    while(idx < n) {
        str = say(str)
        idx += 1
    }

    return str
}

private func say(_ str: String) -> String {
    let s = Array(str)
    var result = [Character]()

    var pos = 0
    var content = read(s, &pos)
    while(content != nil) {
        let (ch, count) = content!
        result.append(Character(String(count)))
        result.append(ch)

        content = read(s, &pos)
    }

    return String(result)
}

private func read(_ str: [Character], _ pos: inout Int) -> (Character, Int)? {
    if pos >= str.count { return nil }

    let ch = str[pos]
    let start = pos
    while(pos < str.count && str[pos] == ch) {
        pos += 1
    }

    return (ch, pos-start)
}
