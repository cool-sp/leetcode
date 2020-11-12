//
//  nextGreatestLetter.swift
//  BinarySearch
//
//  Created by liuning on 2020/11/10.
//

// https://leetcode.com/explore/learn/card/binary-search/137/conclusion/977/

import Foundation

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var left = 0
    var right = letters.count - 1

    while(left <= right) {
        let mid = left + (right-left)/2
        let midVal = letters[mid]

        if midVal > target {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    if left == letters.count { return letters[0] }
    return letters[left]
}
