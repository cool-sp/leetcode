//
//  0062.uniquePaths.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    // think about the bottom-right corner
    // for the bottom row and right-most column, the possible path is 1
    // and then spread matrix count from bottom-right corner
    // it's easy to figure out it's a DP problem
    // code below is up-down reverse the matrix, just for the ease of programming
    
    guard m >= 1 && n >= 1 else { return 0 }

    var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
    matrix[0][0] = 1

    var i = 1
    while(i < m) {
        matrix[i][0] = 1
        i += 1
    }

    var j = 1
    while(j < n) {
        matrix[0][j] = 1
        j += 1
    }

    i = 1
    while(i < m) {
        j = 1
        while(j < n) {
            matrix[i][j] = matrix[i-1][j] + matrix[i][j-1]
            j += 1
        }
        i += 1
    }

    return matrix[m-1][n-1]
}
