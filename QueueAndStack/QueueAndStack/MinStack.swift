//
//  MinStack.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/230/usage-stack/1360/

import Foundation

class MinStack {
    var minIndex = -1
    var array = [(Int, Int)]()

    init() {}

    func push(_ x: Int) {
        if minIndex < 0 {
            minIndex = 0
            array.append((x, 0))
        } else {
            if x >= array[minIndex].0 {
                array.append((x, minIndex))
            } else {
                array.append((x, array.count))
                minIndex = array.count - 1
            }
        }
    }

    func pop() {
        if array.count <= 0 { return }

        if array.count == 1 {
            minIndex = -1
        } else {
            let top = array[array.count-1]
            if top.1 == array.count-1 {
                minIndex = array[array.count-2].1
            }
        }
        array.removeLast()
    }

    func top() -> Int {
        return array[array.count-1].0
    }

    func getMin() -> Int {
        return array[minIndex].0
    }
}
