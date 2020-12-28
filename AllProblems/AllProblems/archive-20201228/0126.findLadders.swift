//
//  0126.findLadders.swift
//  AllProblems
//
//  Created by liuning on 2020/12/21.
//

import Foundation

// need to optimize, only beat 7%

func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
    var wordSet = Set(wordList)
    wordSet.insert(beginWord)
    guard wordSet.contains(endWord) else { return [] }

    let newWordList = Array(wordSet)
    var distanceMap = [Int: [Int]]()
    buildDistanceMap(newWordList, &distanceMap)

    let startIdx = newWordList.firstIndex(of: beginWord)!
    let endIdx = newWordList.firstIndex(of: endWord)!

    var res = [[Int]]()
    bfs(startIdx, endIdx, distanceMap, &res)

    let result = res.map { $0.map { newWordList[$0] } }
    return result
}

private func buildDistanceMap(_ wordList: [String], _ distanceMap: inout [Int: [Int]]) {
    let wordList = wordList.map { Array($0) }
    for i in 0..<wordList.count {
        for j in i+1..<wordList.count {
            if iSNeighbors(wordList[i], wordList[j]) {
                distanceMap[i, default:[]].append(j)
                distanceMap[j, default:[]].append(i)
            }
        }
    }
}

private func iSNeighbors(_ s1: [Character], _ s2: [Character]) -> Bool {
    guard s1.count == s2.count else { return false }

    var distance = 0
    for i in 0..<s1.count {
        if s1[i] != s2[i] {
            distance += 1
            if distance > 1 {
                return false
            }
        }
    }

    return true
}

private func bfs(_ startIdx: Int,
                 _ endIdx: Int,
                 _ distanceMap: [Int: [Int]],
                 _ res: inout [[Int]]) {

    var pathsForward = [[startIdx]]
    var pathsBackward = [[endIdx]]
    var costForward = [Int: Int]()
    var costBackward = [Int: Int]()
    costForward[startIdx] = 1
    costBackward[endIdx] = 1

    var forwardIdxSet = Set<Int>([startIdx])
    var backwardIdxSet = Set<Int>([endIdx])
    var intersection = Set<Int>()

    while !pathsForward.isEmpty && !pathsBackward.isEmpty {
        var nextMoveOfForward = [[Int]]()
        nextMoveOfBFS(pathsForward, distanceMap, &costForward, &nextMoveOfForward, &forwardIdxSet)
        pathsForward = nextMoveOfForward
        intersection = forwardIdxSet.intersection(backwardIdxSet)
        if !intersection.isEmpty {
            break
        }

        var nextMoveOfBackward = [[Int]]()
        nextMoveOfBFS(pathsBackward, distanceMap, &costBackward, &nextMoveOfBackward, &backwardIdxSet)
        pathsBackward = nextMoveOfBackward
        intersection = forwardIdxSet.intersection(backwardIdxSet)
        if !intersection.isEmpty {
            break
        }
    }

    for meetpoint in intersection {
        for forwardPath in pathsForward {
            for backwardPath in pathsBackward {
                if forwardPath.last! == meetpoint && backwardPath.last == meetpoint {
                    res.append(forwardPath + backwardPath.reversed().dropFirst())
                }
            }
        }
    }
}

private func nextMoveOfBFS(_ paths: [[Int]],
                           _ distanceMap: [Int: [Int]],
                           _ cost: inout [Int: Int],
                           _ nextPaths: inout [[Int]],
                           _ idxSet: inout Set<Int>) {
    for path in paths {
        let currIdx = path.last!
        if let neighbors = distanceMap[currIdx] {
            for neighbor in neighbors {
                if cost[neighbor, default: Int.max] > cost[currIdx]! {
                    nextPaths.append(path + [neighbor])
                    idxSet.insert(neighbor)
                    cost[neighbor] = cost[currIdx]! + 1
                }
            }
        }
    }
}
