//
//  0127.ladderLength.swift
//  AllProblems
//
//  Created by liuning on 2020/11/22.
//

import Foundation

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    // it's a BFS
    // for performance reason, all the wording with distance =1 (aka. step = 1) are grouped together
    // for example, we have 'hat' (index i in array) and 'cat' (index j in array)
    // for 'hat', we have:
    //  - '*at'
    //  - 'h*t'
    //  - 'ha*'
    // and for cat, we have:
    //  - '*at'
    //  - 'c*t'
    //  - 'ca*'
    // then we will have a map:
    //  - '*at': i, j
    //  - 'h*t': i
    //  - 'ha*': i
    //  - 'c*t': j
    //  - 'ca*': j
    // then we will have another word: 'bat',
    // we search '*at', 'b*t', 'ba*',
    // for '*at', we will know the word with index i (hat) and j (cat) is the closest words
    guard wordList.count > 0 else { return 0 }
    if beginWord == endWord { return 0 }

    var wordList = wordList

    // end word is not in the word list
    let endWordIndex = wordList.firstIndex(of: endWord)
    if endWordIndex == nil {
        return 0
    }

    // check if begin word is in the word list
    // if not in the list, add it to the end
    // (not neccessary, just for the ease of programming)
    var steps = 0
    var beginWordIndex = wordList.firstIndex(of: beginWord)
    if beginWordIndex == nil {
        wordList.append(beginWord)
        beginWordIndex = wordList.count - 1
    }

    var map = [String: [Int]]()
    build(wordList, &map)

    var visited = Set<Int>()
    var nexts = Set<Int>([beginWordIndex!])
    while(!nexts.isEmpty) {
        steps += 1
        if nexts.contains(endWordIndex!) {
            return steps
        }
        nexts = bfs(nexts, &visited, wordList, &map)
    }

    return 0
}

private func build(_ wordList: [String], _ map: inout [String: [Int]]) {
    for (idx, word) in wordList.enumerated() {
        var arr = Array(word)
        for (i, ch) in arr.enumerated() {
            arr[i] = "*"
            map[String(arr),default:[]].append(idx)
            arr[i] = ch
        }
    }
}

private func bfs(_ visiting: Set<Int>,
                 _ visited: inout Set<Int>,
                 _ wordList: [String],
                 _ map: inout [String: [Int]]) -> Set<Int> {

    var result = Set<Int>()
    for idx in visiting {
        let word = wordList[idx]
        var arr = Array(word)
        for (i, ch) in word.enumerated() {
            arr[i] = "*"
            if let nexts = map[String(arr)] {
                for next in nexts {
                    if !visited.contains(next) {
                        result.insert(next)
                        visited.insert(next)
                    }
                }
            }
            arr[i] = ch
        }
    }

    return result
}
