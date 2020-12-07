//
//  0399.calcEquation.swift
//  AllProblems
//
//  Created by liuning on 2020/12/5.
//

import Foundation

func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    var expression = [String: [(String, Double)]]()
    for idx in 0..<equations.count {
        expression[equations[idx][0], default:[]].append((equations[idx][1], values[idx]))
        expression[equations[idx][1], default:[]].append((equations[idx][0], 1.0/values[idx]))
    }

    var res = [Double]()
    for query in queries {
        var visited = Set<String>()
        res.append(calculate(&expression, &visited, query, 1.0))
    }

    return res
}

private func calculate(_ expression: inout [String: [(String, Double)]], _ visited: inout Set<String>, _ query: [String], _ carry: Double) -> Double {
    let from = query[0]
    let to = query[1]

    if expression[from] == nil { return -1.0 }
    if from == to { return carry }
    visited.insert(from)

    if let targets = expression[from] {
        for target in targets {
            if !visited.contains(target.0) {
                let newCarry = target.1 * carry
                let result = calculate(&expression, &visited, [target.0, to], newCarry)
                if !result.isEqual(to: -1.0) {
                    return result
                }
            }
        }
    }

    return -1.0
}
