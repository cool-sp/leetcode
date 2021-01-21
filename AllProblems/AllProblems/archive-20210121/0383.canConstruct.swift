//
//  0383.canConstruct.swift
//  AllProblems
//
//  Created by liuning on 2021/1/14.
//

import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    let ransomNote = Array(ransomNote)
    let magazine = Array(magazine)

    var ransomArr = Array(repeating: 0, count: 26)
    var magazineArr = Array(repeating: 0, count: 26)

    count(&ransomArr, ransomNote)
    count(&magazineArr, magazine)

    for i in 0..<26 {
        if ransomArr[i] > magazineArr[i] {
            return false
        }
    }
    return true
}

private func count(_ arr: inout [Int], _ str: [Character]) {
    let offset = Character("a").asciiValue!
    for ch in str {
        let idx = Int(ch.asciiValue! - offset)
        arr[idx] += 1
    }
}
