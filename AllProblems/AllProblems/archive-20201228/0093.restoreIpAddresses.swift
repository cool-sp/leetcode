//
//  0093.restoreIpAddresses.swift
//  AllProblems
//
//  Created by liuning on 2020/12/12.
//

import Foundation

func restoreIpAddresses(_ s: String) -> [String] {
    let s = Array(s)
    var res = [String]()
    backtrace(s, [], -1, &res)
    return res
}

private func backtrace(_ s: [Character], _ path: [String], _ lastEndIdx: Int, _ res: inout [String]) {
    guard path.count <= 4 else { return }
    guard lastEndIdx < s.count else { return }

    if path.count == 4 {
        if lastEndIdx == s.count - 1 {
            var result = ""
            for idx in 0...2 {
                result += path[idx] + "."
            }
            result += path[3]
            res.append(result)
        } else {
            return // invalid
        }
    }

    var number = 0
    var idx = lastEndIdx + 1
    let isLeadingZero = (idx < s.count) && s[idx] == "0"
    while idx < s.count {
        number = number*10 + Int(String(s[idx]))!
        if number <= 255 {
            var newPath = path
            newPath.append(String(number))
            backtrace(s, newPath, idx, &res)
        } else {
            return
        }

        if isLeadingZero {
            return
        }
        idx += 1
    }
}
