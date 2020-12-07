//
//  0289.gameOfLife.swift
//  AllProblems
//
//  Created by liuning on 2020/11/28.
//

import Foundation

func gameOfLife(_ board: inout [[Int]]) {
    guard board.count > 0 else { return }
    guard board[0].count > 0 else { return }

    for i in 0..<board.count {
        for j in 0..<board[0].count {
            calculate(&board, i, j)
        }
    }

    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == 2 { board[i][j] = 0 }
            if board[i][j] == 3 { board[i][j] = 1 }
        }
    }
}

private func calculate(_ board: inout [[Int]], _ i: Int, _ j: Int) {
    // -1: invalid
    // 0: dead
    // 1: live
    // 2: (live->dead)
    // 3: (dead->live)
    let T = eval(board, i-1, j)
    let D = eval(board, i+1, j)
    let L = eval(board, i, j-1)
    let R = eval(board, i, j+1)
    let TL = eval(board, i-1, j-1)
    let TR = eval(board, i-1, j+1)
    let DL = eval(board, i+1, j-1)
    let DR = eval(board, i+1, j+1)

    let matrix = [T, D, L, R, TL, TR, DL, DR]

    var countOfLive = 0
    for i in 0..<matrix.count {
        if matrix[i] == 1  || matrix[i] == 2 {
            countOfLive += 1
        }
    }

    let curr = board[i][j]

    var newState = 0
    switch(curr, countOfLive) {
    case (1, 0..<2): newState = 2
    case (1, 2...3): newState = 1
    case (1, 4...8): newState = 2
    case (0, 3):     newState = 3
    default:         newState = curr
    }

    board[i][j] = newState
}

private func eval(_ board: [[Int]], _ i: Int, _ j: Int) -> Int {
    if i < 0 || i >= board.count { return -1 }
    if j < 0 || j >= board[0].count { return -1 }

    return board[i][j]
}
