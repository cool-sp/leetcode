//
//  findWords.swift
//  Trie
//
//  Created by liuning on 2020/11/13.
//

// https://leetcode.com/explore/learn/card/trie/149/practical-application-ii/1056/

import Foundation

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    guard words.count > 0 else { return [] }
    guard board.count > 0 else { return [] }
    guard board[0].count > 0 else { return [] }

    let trie = Trie()
    for word in words {
        trie.insert(word)
    }

    var result = [String]()
    var board = board
    for row in 0..<board.count {
        for column in 0..<board[0].count {
            search(&board, row, column, trie.root, [], &result)
        }
    }

    return Array(result)
}

private func search(_ board: inout [[Character]],
                    _ row: Int,
                    _ column: Int,
                    _ node: TrieNode,
                    _ cache: [Character],
                    _ result: inout [String]) {
    guard row >= 0 else { return }
    guard row < board.count else { return }
    guard column >= 0 else { return }
    guard column < board[0].count else { return }

    let ch = board[row][column]

    if let nextNode = node.children[ch] {
        var nextCache = cache
        nextCache.append(ch)

        let oldch = board[row][column]
        board[row][column] = "."

        if nextNode.isWord {
            result.append(String(nextCache))
            node.children[ch] = nil
        }

        search(&board, row-1, column, nextNode, nextCache, &result)
        search(&board, row, column-1, nextNode, nextCache, &result)
        search(&board, row+1, column, nextNode, nextCache, &result)
        search(&board, row, column+1, nextNode, nextCache, &result)

        board[row][column] = oldch
    }
}
