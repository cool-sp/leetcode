//
//  0301.removeInvalidParentheses.swift
//  AllProblems
//
//  Created by liuning on 2020/12/7.
//

import Foundation

func removeInvalidParentheses(_ s: String) -> [String] {
    let s = Array(s)

    var eraseL = 0
    var eraseR = 0
    for ch in s {
        if ch == "(" {
            eraseL += 1
        } else if ch == ")" {
            if eraseL == 0 {
                eraseR += 1
            } else {
                eraseL -= 1
            }
        }
    }

    var result = Set<String>()
    dfs(s, 0, eraseL, eraseR, 0, 0, &result)

    if result.isEmpty { return [""] }
    else { return Array(result) }
}

private func dfs(_ s: [Character],
                 _ idx: Int,
                 _ eraseL: Int,
                 _ eraseR: Int,
                 _ countL: Int,
                 _ countR: Int,
                 _ result: inout Set<String>) {

    if eraseL < 0 || eraseR < 0 { return }
    if countR > countL { return }

    if idx == s.count {
        if countL == countR {
            result.insert(String(s))
        }
        return
    }

    var newEraseL = eraseL
    var newEraseR = eraseR
    var newCountL = countL
    var newCountR = countR

    if s[idx] != "(" && s[idx] != ")" {
        dfs(s, idx+1, eraseL, eraseR, countL, countR, &result)
    } else {
        // if we want to remove this char
        var chDeleted = false
        if s[idx] == "(" && newEraseL > 0  {
            chDeleted = true
            newEraseL -= 1
        } else if s[idx] == ")" && newEraseR > 0 {
            chDeleted = true
            newEraseR -= 1
        }
        if chDeleted {
            var copy = s
            copy.remove(at: idx)
            dfs(copy, idx, newEraseL, newEraseR, countL, countR, &result)
        }

        // if we want to keep this char
        if s[idx] == "(" {
            newCountL += 1
        } else {
            newCountR += 1
        }
        if newCountL >= newCountR {
            dfs(s, idx+1, eraseL, eraseR, newCountL, newCountR, &result)
        }
    }
}
