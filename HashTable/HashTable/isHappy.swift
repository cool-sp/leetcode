//
//  isHappy.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/183/combination-with-other-algorithms/1131/

import Foundation

func isHappy(_ n: Int) -> Bool {
    var set = Set<Int>()
    var nextNum = nextNumber(n)
    while(nextNum != 1 && !set.contains(nextNum)) {
        set.insert(nextNum)
        nextNum = nextNumber(nextNum)
    }

    return nextNum == 1
}

private func nextNumber(_ n: Int) -> Int {
    var num = n
    var sum = 0
    while(num != 0) {
        let temp = num%10
        sum += temp*temp
        num = num/10
    }

    return sum
}
