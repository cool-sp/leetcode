//
//  0242.isAnagram.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }

    let s = Array(s)
    let t = Array(t)

    var smap = [Character: Int]()
    var tmap = [Character: Int]()

    for ch in s { smap[ch, default:0] += 1 }
    for ch in t { tmap[ch, default:0] += 1 }

    for key in smap.keys {
        let chs = smap[key]!

        if let cht = tmap[key] {
            if chs != cht { return false }
        } else {
            return false
        }
    }

    return true
}
