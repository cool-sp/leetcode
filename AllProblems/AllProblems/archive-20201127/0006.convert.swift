//
//  0006.convert.swift
//  AllProblems
//
//  Created by liuning on 2020/11/18.
//

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows <= 1 { return s }
    
    var rows = Array(repeating: [Character](), count: numRows)

    for (idx, ch) in s.enumerated() {
        let rowIdx = getTargetRowIdx(idx, numRows)
        rows[rowIdx].append(ch)
    }

    for i in 1..<numRows {
        rows[0].append(contentsOf: rows[i])
    }

    return String(rows[0])
}

private func getTargetRowIdx(_ charIdx: Int, _ numRows: Int) -> Int {
    let groupCount = 2*numRows - 2
    let charIdx = charIdx % groupCount

    if charIdx >= 0 && charIdx < numRows {
        return charIdx
    } else {
        return 2*numRows - 2 - charIdx
    }
}
