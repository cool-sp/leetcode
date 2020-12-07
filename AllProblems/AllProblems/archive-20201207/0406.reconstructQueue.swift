//
//  0406.reconstructQueue.swift
//  AllProblems
//
//  Created by liuning on 2020/12/5.
//

import Foundation

func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    guard people.count > 0 else { return [] }

    let sortedPeople = people.sorted { (arr1, arr2) -> Bool in
        if arr1[0] > arr2[0] {
            return true
        } else if arr1[0] == arr2[0] {
            return arr1[1] < arr2[1]
        } else {
            return false
        }
    }

    var res = [[Int]]()
    for i in 0..<sortedPeople.count {
        res.insert(sortedPeople[i], at: sortedPeople[i][1])
    }

    return res
}
