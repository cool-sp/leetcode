//
//  numIslands.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/231/practical-application-queue/1374/

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }

    var cnt = 0
    var grid = grid

    for r in 0..<grid.count {
        for c in 0..<grid[0].count {
            if grid[r][c] == "1" {
                travel(&grid, r, c)
                cnt += 1
            }
        }
    }
    return cnt
}

private func travel(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
    let rowCnt = grid.count
    let colCnt = grid[0].count

    if r < 0 || r >= rowCnt { return }
    if c < 0 || c >= colCnt { return }
    if grid[r][c] == "0" { return }

    grid[r][c] = "0"

    travel(&grid, r+1, c)
    travel(&grid, r, c+1)
    travel(&grid, r-1, c)
    travel(&grid, r, c-1)
}
