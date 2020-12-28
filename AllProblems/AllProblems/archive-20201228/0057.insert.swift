//
//  0057.insert.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

private enum EdgeNode: Equatable {
    case LEFT(Int)
    case RIGHT(Int)

    func getVal() -> Int {
        switch self {
        case .LEFT(let val): return val
        case .RIGHT(let val): return val
        }
    }
}

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var arr = [EdgeNode]()

    for item in intervals {
        arr.append(.LEFT(item[0]))
        arr.append(.RIGHT(item[1]))
    }

    arr.append(.LEFT(newInterval[0]))
    arr.append(.RIGHT(newInterval[1]))

    arr.sort { (a, b) -> Bool in
        if a.getVal() < b.getVal() {
            return true
        }
        else if a.getVal() == b.getVal() {
            if case EdgeNode.LEFT = a {
                return true
            }
        }
        return false
    }

    var res = [[Int]]()
    var balance = 0
    for edge in arr {
        if isLeft(edge) {
            balance += 1
        } else {
            balance -= 1
        }

        if balance == 1 && isLeft(edge) {
            if res.count > 0 && edge.getVal() <= res[res.count-1][1] { // L, R hits same value
                res[res.count-1].removeLast()
            } else {
                res.append([edge.getVal()])
            }
        } else if balance == 0 {
            if res[res.count-1].count > 1 {
                res[res.count-1][1] = edge.getVal()
            } else {
                res[res.count-1].append(edge.getVal())
            }
        }
    }

    return res
}

private func isLeft(_ node: EdgeNode) -> Bool {
    if case EdgeNode.LEFT = node {
        return true
    }
    return false
}

