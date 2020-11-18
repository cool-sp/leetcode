//
//  canVisitAllRooms.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/239/conclusion/1391/

import Foundation

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var keys = Set<Int>([0])
    var nextKeys = keys

    while(nextKeys.count > 0) {
        var temp = Set<Int>()
        for key in nextKeys {
            temp = temp.union(rooms[key])
        }

        nextKeys = temp.subtracting(keys)
        keys = temp.union(keys)
    }

    return keys.count == rooms.count
}
