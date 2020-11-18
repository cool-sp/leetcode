//
//  floodFill.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/239/conclusion/1393/

import Foundation

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var copy = image
    let oldColor = image[sr][sc]
    
    if oldColor == newColor { return image }

    fill(&copy, sr, sc, oldColor, newColor)
    return copy
}

private func fill(_ image: inout [[Int]],
                  _ sr: Int,
                  _ sc: Int,
                  _ oldColor: Int,
                  _ newColor: Int) {
    let rowCnt = image.count
    let colCnt = image[0].count

    if sr < 0 || sr >= rowCnt { return }
    if sc < 0 || sc >= colCnt { return }
    if image[sr][sc] != oldColor { return }

    image[sr][sc] = newColor

    fill(&image, sr+1, sc, oldColor, newColor)
    fill(&image, sr, sc+1, oldColor, newColor)
    fill(&image, sr-1, sc, oldColor, newColor)
    fill(&image, sr, sc-1, oldColor, newColor)
}
