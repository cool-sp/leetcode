//
//  0295.MedianFinder.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

class Heap {
    var sort: (Int, Int) -> Bool
    var capacity: Int
    var count: Int
    var tree: [Int]

    init(_ sort: @escaping (Int, Int) -> Bool) {
        self.sort = sort
        self.tree = [Int]()
        self.capacity = 0
        self.count = 0
    }

    func add(_ val: Int) {
        if capacity == count {
            tree.append(val)
            capacity += 1
            count += 1
        } else {
            tree[count] = val
            count += 1
        }

        var c = count - 1
        var p = parent(c)
        while p >= 0 && sort(tree[c], tree[p]) {
            swap(&tree, c, p)
            c = p
            p = parent(c)
        }
    }

    func remove() -> Int? {
        guard count > 0 else { return nil }
        let top = tree[0]
        tree[0] = tree[count-1]
        count -= 1

        var p = 0
        var lft = leftChild(p)
        var rht = rightChild(p)

        while(lft < count) {
            var next = p
            if sort(tree[lft], tree[next]) {
                next = lft
            }
            if rht < count && sort(tree[rht], tree[next]) {
                next = rht
            }

            if next == p { break }
            swap(&tree, next, p)

            p = next
            lft = leftChild(p)
            rht = rightChild(p)
        }

        return top
    }

    func top() -> Int? {
        guard count > 0 else { return nil }
        return tree[0]
    }

    private func leftChild(_ i: Int) -> Int {
        return (2 * i) + 1
    }

    private func rightChild(_ i: Int) -> Int {
        return (2 * i) + 2
    }

    private func parent(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    private func swap(_ tree: inout [Int], _ i: Int, _ j: Int) {
        let temp = tree[i]
        tree[i] = tree[j]
        tree[j] = temp
    }
}

class MedianFinder {
    var maxHeap = Heap(>)
    var minHeap = Heap(<)

    init() {}

    func addNum(_ num: Int) {
        if let rightMin = minHeap.top(), num > rightMin {
            minHeap.add(num)
        } else {
            maxHeap.add(num)
        }

        if maxHeap.count > minHeap.count + 1, let moved = maxHeap.remove() {
            minHeap.add(moved)
        } else if minHeap.count > maxHeap.count + 1, let moved = minHeap.remove() {
            maxHeap.add(moved)
        }
    }

    func findMedian() -> Double {
        if maxHeap.count >= minHeap.count + 1 {
            return Double(maxHeap.top()!)
        } else if minHeap.count >= maxHeap.count + 1 {
            return Double(minHeap.top()!)
        } else {
            return Double(maxHeap.top()! + minHeap.top()!) / 2
        }
    }
}
