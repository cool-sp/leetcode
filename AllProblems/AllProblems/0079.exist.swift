//
//  0079.exist.swift
//  AllProblems
//
//  Created by liuning on 2020/11/21.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard board.count > 0 else { return false }
    guard board[0].count > 0 else { return false }

    var board = board
    let rowCnt = board.count
    let colCnt = board[0].count

    var map = [Character: [(Int, Int)]]()
    for r in 0..<rowCnt {
        for c in 0..<colCnt {
            map[board[r][c], default:[]].append((r, c))
        }
    }

    let word = Array(word)

    if let starts = map[word[0]] {
        for (r, c) in starts {
            if search(&board, word, 0, r, c) {
                return true
            }
        }
    }

    return false
}

private func search(_ board: inout [[Character]], _ word: [Character], _ pos: Int, _ r: Int, _ c: Int) -> Bool {
    if pos >= word.count { return true }
    if r < 0 || r >= board.count { return false }
    if c < 0 || c >= board[0].count { return false }

    if board[r][c] != word[pos] { return false }
    board[r][c] = "*"

    var ret = false
    ret = ret || search(&board, word, pos+1, r+1, c)
    ret = ret || search(&board, word, pos+1, r, c+1)
    ret = ret || search(&board, word, pos+1, r-1, c)
    ret = ret || search(&board, word, pos+1, r, c-1)

    board[r][c] = word[pos]

    return ret
}
