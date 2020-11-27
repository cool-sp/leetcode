//
//  0131.partition.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

func partition(_ s: String) -> [[String]] {
    let s = Array(s)
    return partition(s, 0)
}

func partition(_ s: [Character], _ offset: Int) -> [[String]] {
    let leadingPalindromes = getLeadingPalindromes(s, offset)

    var result = [[String]]()
    for len in leadingPalindromes {
        var subresult = partition(s, offset+len)
        let leading = String(s[offset..<offset+len])

        if subresult.isEmpty {
            result.append([leading])
        } else {
            for idx in 0..<subresult.count {
                subresult[idx].insert(leading, at: 0)
            }

            result.append(contentsOf: subresult)
        }
    }

    return result
}

private func getLeadingPalindromes(_ s: [Character], _ offset: Int) -> [Int] {
    var result = [Int]()
    for j in offset..<s.count {
        if isPalindromes(s, offset, j) {
            result.append(j-offset+1)
        }
    }
    return result
}

private func isPalindromes(_ s: [Character], _ i: Int, _ j: Int) -> Bool {
    if i > j { return false }
    var i = i
    var j = j
    while(i<=j) {
        if s[i] == s[j] {
            i += 1
            j -= 1
        } else {
            break
        }
    }
    return i > j
}

