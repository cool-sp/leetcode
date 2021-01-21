//
//  0299.getHint.swift
//  AllProblems
//
//  Created by liuning on 2021/1/3.
//

import Foundation

func getHint(_ secret: String, _ guess: String) -> String {
    let secret = Array(secret)
    let guess = Array(guess)

    let secretPattern = buildPattern(secret)
    let guessPattern = buildPattern(guess)

    var bulls = Array(repeating: 0, count: 10)
    var cows = Array(repeating: 0, count: 10)

    for i in 0..<10 {
        cows[i] = min(secretPattern[i], guessPattern[i])
    }

    for j in 0..<secret.count {
        if secret[j] == guess[j] {
            let idx = Int(secret[j].asciiValue! - Character("0").asciiValue!)
            cows[idx] -= 1
            bulls[idx] += 1
        }
    }

    let sumOfBulls = bulls.reduce(0, +)
    let sumOfCows = cows.reduce(0, +)

    return "\(sumOfBulls)A\(sumOfCows)B"
}

private func buildPattern(_ str: [Character]) -> [Int] {
    var res = Array(repeating: 0, count: 10)

    for ch in str {
        let idx = Int(ch.asciiValue! - Character("0").asciiValue!)
        res[idx] += 1
    }
    return res
}
