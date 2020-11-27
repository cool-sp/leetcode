//
//  0010.isMatch.swift
//  AllProblems
//
//  Created by liuning on 2020/11/18.
//

import Foundation

enum RegexNode: Equatable {
    case START
    case END
    case CHAR(Character)
    case DOT
    case DOTSTAR
    case STAR(Character)
}

func isMatch(_ s: String, _ p: String) -> Bool {
    let regexNodes = buildRegex(p)

    let s = Array(s)
    var nextMove = tryMatch(s, 0, regexNodes, 0)
    while(!nextMove.isEmpty) {
        let (pos, idx) = nextMove.removeFirst()
        if pos == s.count && regexNodes[idx] == .END {
            return true
        }

        let nextCandidates = tryMatch(s, pos, regexNodes, idx)
        nextMove.append(contentsOf: nextCandidates)
    }

    return false
}

private func tryMatch(_ s: [Character],
                     _ pos: Int,
                     _ regexNodes: [RegexNode],
                     _ regexNodeIdx: Int) -> [(Int, Int)] {

    switch(regexNodes[regexNodeIdx]) {
    case .START:
        return [(pos, regexNodeIdx+1)]
    case .CHAR(let expect):
        if pos < s.count && expect == s[pos] {
            return [(pos+1, regexNodeIdx+1)]
        } else {
            return []
        }
    case .DOT:
        return [(pos+1, regexNodeIdx+1)]
    case .DOTSTAR:
        var ret = [(pos+1, regexNodeIdx+1),      // consumes both char and regax
                   (pos, regexNodeIdx+1)]        // consumes regex, keep char
        if pos < s.count {
            ret.append((pos+1, regexNodeIdx))    // consumes char, keep regex
        }
        return ret
    case .STAR(let expect):
        if pos < s.count && expect == s[pos] {
            return [(pos+1, regexNodeIdx),       // consumes char, keep regex
                    (pos+1, regexNodeIdx+1),     // consumes both char and regax
                    (pos, regexNodeIdx+1)]       // consumes regex, keep char
        } else {
            return [(pos, regexNodeIdx+1)]
        }
    default:
        return []
    }
}

private func buildRegex(_ p: String) -> [RegexNode] {
    let p = Array(p)

    var regexNodes = [RegexNode]()
    regexNodes.append(.START)

    var pos = 0
    var prev = RegexNode.START
    var node = read(p, &pos)
    while(node != .END) {

        // try to merge the nodes ...
        // just for performance
        var skip = false
        switch((prev, node)) {
        case (.STAR(let ch1), .STAR(let ch2)): skip = ch1 == ch2
        case (.DOTSTAR, .DOTSTAR): skip = true
        default: skip = false
        }

        if !skip {
            regexNodes.append(node)
        } else {
            print("")
        }
        prev = node
        node = read(p, &pos)
    }

    regexNodes.append(.END)
    return regexNodes
}

private func read(_ p: [Character], _ pos: inout Int) -> RegexNode {
    // if it's end ...
    if pos >= p.count {
        return .END
    }

    // if next char is the tail ...
    if pos == p.count - 1 {
        if p[pos] == "." {
            pos += 1
            return .DOT
        } else {
            let ret = RegexNode.CHAR(p[pos])
            pos += 1
            return ret
        }
    }

    // if we have the next char to check ...
    switch((p[pos], p[pos+1])) {
    case (let ch, "*"):
        pos += 2
        if ch == "." {
            return .DOTSTAR
        } else {
            return .STAR(ch)
        }
    case (".", _):
        pos += 1
        return .DOT
    case (let ch, _):
        pos += 1
        return .CHAR(ch)
    }
 }

