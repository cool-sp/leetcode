//
//  0146.LRUCache.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

class LinkedNode {
    var key: Int
    var val: Int
    var next: LinkedNode?
    var prev: LinkedNode?
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    var map = [Int: LinkedNode]()
    var root = LinkedNode(0, 0)
    var tail: LinkedNode?
    let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = map[key] {
            moveToHead(node, false)
            return node.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if self.capacity <= 0 { return }

        if let node = map[key] {
            node.val = value
            moveToHead(node, false)
        } else {
            if map.count >= capacity {
                if let k = removeTail() {
                    map[k] = nil
                }
            }
            let newNode = LinkedNode(key, value)
            moveToHead(newNode, true)
            map[key] = newNode
        }
    }

    private func removeTail() -> Int? {
        var removedKey: Int? = nil
        if let tail = self.tail {
            removedKey = tail.key
            if tail.prev === root {
                self.tail = nil
            } else {
                let prev = tail.prev!
                prev.next = nil
                self.tail = prev
            }
        }
        return removedKey
    }

    private func moveToHead(_ node: LinkedNode, _ isNewNode: Bool) {
        if isNewNode {
            node.prev = root
            node.next = root.next
            root.next?.prev = node
            root.next = node

            if tail == nil { tail = node }
            return
        }

        if let prev = node.prev {
            if prev !== root {
                let oldPrev = node.prev
                let oldNext = node.next
                oldPrev?.next = oldNext
                oldNext?.prev = oldPrev

                node.prev = root
                node.next = root.next
                root.next?.prev = node
                root.next = node

                if tail === node { tail = oldPrev }
            }
        }
    }
}
