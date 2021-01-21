//
//  0223.computeArea.swift
//  AllProblems
//
//  Created by liuning on 2020/12/28.
//

import Foundation

func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
    let area1 = abs(A-C)*abs(B-D)
    let area2 = abs(E-G)*abs(F-H)

    let commonX = (C-E)*(G-A) >= 0
    let commonY = (B-H)*(F-D) >= 0

    var commonArea = 0
    if commonX && commonY {
        commonArea = commonHelper(A, C, E, G) * commonHelper(B, D, F, H)
    }

    return area1 + area2 - commonArea
}

private func commonHelper(_ a1: Int, _ a2: Int, _ b1: Int, _ b2: Int) -> Int {
    if a1 > b1 { return commonHelper(b1, b2, a1, a2) }

    if b1 >= a1 && a2 >= b2 { // contains
        return b2 - b1
    } else {
        return min(abs(a2-b1), abs(b2-a1))
    }
}
