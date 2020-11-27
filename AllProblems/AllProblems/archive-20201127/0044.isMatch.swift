//
//  0044.isMatch.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

// dp[i][j] = true, means substring of prefix string of s (length i)
// matchs pattern prefix string of p (length j)
// so basically we will have
//   - if p[j-1] is char, then dp[i][j] = (s[i-1] == p[j-1]) && dp[i-1][j-1]
//   - if p[j-1] is '?',  then dp[i][j] = dp[i-1][j-1]
//   - if p[j-1] is '*',  then dp[i][j] = dp[i-1][j] || dp[i][j-1]
// and for the edge case:
//   - dp[0][0] = true
//   - dp[i][0] = false
//   - dp[0][j] = true if the start part is all '*' of length j
// and ou final answer is dp[m][n], m,n is the lenght of string s and p

func isMatch44(_ s: String, _ p: String) -> Bool {
    let s = Array(s)
    let p = Array(p)

    let m = s.count
    let n = p.count

    var dp = Array(repeating: Array(repeating: false, count: n+1), count: m+1)
    dp[0][0] = true

    var cntOfLeadingStar = 0
    for ch in p {
        if ch == "*" { cntOfLeadingStar += 1 }
        else { break }
    }

    var j = 1
    while(j <= cntOfLeadingStar) {
        dp[0][j] = true
        j += 1
    }

    var i = 1
    while(i <= m) {
        j = 1
        while(j <= n) {
            if s[i-1] == p[j-1] || p[j-1] == "?" {
                dp[i][j] = dp[i-1][j-1]
            } else if p[j-1] == "*" {
                dp[i][j] = dp[i-1][j] || dp[i][j-1]
            }
            j += 1
        }
        i += 1
    }

    return dp[m][n]
}
