//
//  0187.findRepeatedDnaSequences.swift
//  AllProblems
//
//  Created by liuning on 2020/12/26.
//

import Foundation

func findRepeatedDnaSequences(_ s: String) -> [String] {
    guard s.count > 10 else { return [] }
    let s = Array(s)
    var dict = [Int: Int]()

    var encodedInt = toEncodedInt(s, 0)
    dict[encodedInt, default:0] += 1
    for i in 1..<s.count-9 {
        encodedInt = nextEncodedInt(encodedInt, s[i+9])
        dict[encodedInt, default:0] += 1
    }

    let res = dict.filter { $0.value > 1 }.map{ toString($0.key) }
    return res
}

private func toEncodedInt(_ arr: [Character], _ offset: Int) -> Int {
    var res = 0;
    for i in offset..<offset+10 {
        res = res*4 + mapped(arr[i])
    }
    return res
}

private func nextEncodedInt(_ prev: Int, _ nextCh: Character) -> Int {
    var prev = prev
    prev = prev % Int(pow(4.0, 9))
    return prev*4 + mapped(nextCh)
}

private func mapped(_ ch: Character) -> Int {
    switch ch {
    case "A": return 0
    case "C": return 1
    case "G": return 2
    case "T": return 3
    default: return 0
    }
}

private func unmapped(_ val: Int) -> Character {
    return ["A", "C", "G", "T"][val]
}

private func toString(_ encodedInt: Int) -> String {
    var res = [Character]()

    var val = encodedInt
    var base = Int(pow(4.0, 9))
    for _ in 0...9 {
        let leading = val / base
        res.append(unmapped(leading))
        val = val % base
        base = base / 4
    }

    return String(res)
}
