//
//  0056.merge.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation


func merge(_ intervals: [[Int]]) -> [[Int]] {
    // the basic idea is to treat the interval left and right edges as two nodes
    // and seperate them
    // then we through the nodes and merge them
    var edges = convert(intervals)

    // sort the edges
    // if left edge equals right edge, then left edge is first
    edges.sort { (edgeA, edgeB) -> Bool in
        if edgeA.0 < edgeB.0 {
            return true
        } else if edgeA.0 == edgeB.0 {
            return edgeA.1
        }
        return false
    }

    var edgeStacks = [(Int, Bool)]()
    var balance = 0
    for edge in edges {
        if balance == 0 { edgeStacks.append(edge) }

        if edge.1 { balance += 1 }
        else { balance -= 1 }

        if balance == 0 { edgeStacks.append(edge) }
    }

    var result = [[Int]]()
    for idx in 0..<edgeStacks.count {
        if idx % 2 == 0 {
            result.append([edgeStacks[idx].0])
        } else {
            result[result.count-1].append(edgeStacks[idx].0)
        }
    }

    return result
}

private func convert(_ intervals: [[Int]]) -> [(Int, Bool)] {
    var result = [(Int, Bool)]()
    for interval in intervals {
        result.append((interval[0], true))  // left edge
        result.append((interval[1], false)) // right edge
    }

    return result
}
