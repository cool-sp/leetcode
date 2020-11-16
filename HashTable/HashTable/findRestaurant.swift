//
//  findRestaurant.swift
//  HashTable
//
//  Created by ning on 2020/11/14.
//

// https://leetcode.com/explore/learn/card/hash-table/184/comparison-with-other-data-structures/1177/

import Foundation

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    let map1 = generateMap(list1)
    let map2 = generateMap(list2)
    let common = Set(map1.keys).intersection(Set(map2.keys))

    var weight = Int.max
    var result = [String]()
    for choice in common {
        let temp = map1[choice]! + map2[choice]!
        if temp < weight {
            result = [choice]
            weight = temp
        } else if temp == weight {
            result.append(choice)
        }
    }
    return result
}

private func generateMap(_ list: [String]) -> [String: Int] {
    var map = [String: Int]()

    for idx in 0..<list.count {
        map[list[idx]] = idx
    }

    return map
}
