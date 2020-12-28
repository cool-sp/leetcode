//
//  0068.fullJustify.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var res = [String]()
    var currLine = ""
    var remaining = maxWidth
    var i = 0
    while i < words.count {
        var wordIdxOffset = 0
        var isLastLine = false
        while i + wordIdxOffset < words.count
                && remaining - words[i+wordIdxOffset].count >= 0 {
            remaining -= words[i+wordIdxOffset].count
            wordIdxOffset += 1
        }

        if i + wordIdxOffset >= words.count {
            isLastLine = true
        }
        wordIdxOffset -= 1

        // not enough space in-between words
        while remaining < wordIdxOffset {
            remaining += words[i+wordIdxOffset].count
            wordIdxOffset -= 1
            isLastLine = false // put the word back, so not the last line
        }

        // word..(spaceLen+additionSpace)...word(spaceTailing)
        let spaceSlotCnt = wordIdxOffset
        let spaceLen: Int
        var additionSpace: Int
        let spaceTailing: Int
        if isLastLine {
            spaceLen = 1
            additionSpace = 0
            spaceTailing = remaining - spaceSlotCnt
        } else if spaceSlotCnt > 0 {
            spaceLen = remaining / spaceSlotCnt
            additionSpace = remaining % spaceSlotCnt
            spaceTailing = 0
        } else {
            spaceLen = 0
            additionSpace = 0
            spaceTailing = remaining
        }

        var j = 0
        while j < wordIdxOffset {
            currLine += words[i+j]
            currLine += String(repeating: " ", count: spaceLen)
            if additionSpace > 0 {
                currLine += " "
                additionSpace -= 1
            }
            j += 1
        }
        currLine += words[i+j]
        currLine += String(repeating: " ", count: spaceTailing)

        res.append(currLine)
        currLine = ""
        i += wordIdxOffset + 1
        remaining = maxWidth
    }
    return res
}
