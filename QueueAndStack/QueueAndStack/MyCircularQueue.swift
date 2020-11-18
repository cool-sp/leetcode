//
//  MyCircularQueue.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/228/first-in-first-out-data-structure/1337/

import Foundation

class MyCircularQueue {
    var array: [Int]
    let k: Int
    var head: Int
    var tail: Int

    init(_ k: Int) {
        self.k = k
        self.array = Array(repeating: 0, count: k)

        self.head = -1
        self.tail = -1
    }

    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        tail = (tail + 1) % k
        array[tail] = value
        if head < 0 { head = 0 }
        return true
    }

    func deQueue() -> Bool {
        if isEmpty() { return false }
        head = (head + 1) % k

        if (tail + 1) % k == head {
            head = -1
            tail = -1
        }
        return true
    }

    func Front() -> Int {
        if isEmpty() { return -1 }
        return array[head]
    }

    func Rear() -> Int {
        if isEmpty() { return -1 }
        return array[tail]
    }

    func isEmpty() -> Bool {
        return head == tail && head < 0
    }

    func isFull() -> Bool {
        return (tail + 1) % k == head
    }
}
