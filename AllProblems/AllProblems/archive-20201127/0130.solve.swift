//
//  0130.solve.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

func solve(_ board: inout [[Character]]) {
    let rowCnt = board.count
    guard rowCnt > 0 else { return }
    let colCnt = board[0].count
    guard rowCnt > 0 else { return }

    var history = Array(repeating: Array(repeating: false, count: colCnt), count: rowCnt)

    var pixl = findFirstO(board, history)
    while(pixl != nil) {
        var area = [(Int, Int)]()
        let shouldKeepO = travel(&board, &history, &area, pixl!.0, pixl!.1)
        if !shouldKeepO {
            for (r, c) in area {
                board[r][c] = "X"
            }
        }
        pixl = findFirstO(board, history)
    }
}

private func travel(_ board: inout [[Character]],
                    _ history: inout [[Bool]],
                    _ area: inout [(Int, Int)],
                    _ r: Int, _ c: Int) -> Bool {
    let rowCnt = board.count
    let colCnt = board[0].count

    if r < 0 || r >= rowCnt { return true }
    if c < 0 || c >= colCnt { return true }
    if board[r][c] == "X" { return false }
    if history[r][c] { return false }

    area.append((r, c))
    history[r][c] = true

    var result = false
    result = travel(&board, &history, &area, r+1, c) || result
    result = travel(&board, &history, &area, r, c+1) || result
    result = travel(&board, &history, &area, r-1, c) || result
    result = travel(&board, &history, &area, r, c-1) || result

    return result
}

private func findFirstO(_ board: [[Character]], _ history: [[Bool]]) -> (Int, Int)? {
    let rowCnt = board.count
    let colCnt = board[0].count

    for r in 0..<rowCnt {
        for c in 0..<colCnt {
            if !history[r][c] && board[r][c] == "O" {
                return (r, c)
            }
        }
    }

    return nil
}
