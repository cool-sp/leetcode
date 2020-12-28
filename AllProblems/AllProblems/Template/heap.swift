//
//  heap.swift
//  AllProblems
//
//  Created by liuning on 2020/11/29.
//

import Foundation

private extension Int {
    var parent: Int {
        return (self - 1) / 2
    }

    var leftChild: Int {
        return (self * 2) + 1
    }

    var rightChild: Int {
        return (self * 2) + 2
    }
}

private func swap(_ arr: inout [Int], _ i: Int, _ j: Int) {
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
}

func heapifyUp(_ arr: inout [Int], _ from: Int, sortBy: (Int, Int) -> Bool) {
    var from = from
    var parent = from.parent
    while parent >= 0 && sortBy(arr[from], arr[parent]) {
        swap(&arr, parent, from)
        from = parent
        parent = from.parent
    }
}

func heapifyDown(_ arr: inout [Int], _ from: Int, _ to: Int, sortBy: (Int, Int) -> Bool) {
    var parent = from
    var leftChild = parent.leftChild
    var rightChild = parent.rightChild

    while leftChild <= to {
        var next = parent
        if sortBy(arr[leftChild], arr[next]) {
            next = leftChild
        }
        if rightChild <= to && sortBy(arr[rightChild], arr[next]) {
            next = rightChild
        }

        if next != parent {
            swap(&arr, parent, next)
        } else {
            break
        }

        parent = next
        leftChild = parent.leftChild
        rightChild = parent.rightChild
    }
}

func heapSort(_ arr: inout [Int]) {
    guard arr.count > 0 else { return }

    // build heap first
    for i in stride(from: (arr.count-1).parent, to: -1, by: -1) {
        heapifyDown(&arr, i, arr.count-1, sortBy: >)
    }

    for i in stride(from: arr.count-1, to: 0, by: -1) {
        swap(&arr, i, 0) // swap the largest, so it's ascending order
        heapifyDown(&arr, 0, i-1, sortBy: >)
    }
}
