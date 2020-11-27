//
//  0215.findKthLargest.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums
    guard k >= 1 else { return Int.min }
    guard k <= nums.count else { return Int.min }
    guard nums.count > 0 else { return Int.min }

    return quickSearch(&nums, k, 0, nums.count-1)
}

private func quickSearch(_ nums: inout [Int], _ k: Int, _ from: Int, _ to: Int) -> Int {
    let (leftCount, rightCount) = partition(&nums, from, to)

    if k == rightCount + 1 {
        return nums[from+leftCount]
    } else if k < rightCount + 1 {
        return quickSearch(&nums, k, from+leftCount+1, to)
    } else {
        return quickSearch(&nums, k-rightCount-1, from, from+leftCount-1)
    }
}

private func partition(_ nums: inout [Int], _ from: Int, _ to: Int) -> (Int, Int) {
    if from < 0 || from >= nums.count { return (-1, -1) }
    if to < 0 || to >= nums.count { return (-1, -1) }
    if from > to { return (-1, -1) }
    if from == to { return (0, 0) }

    let count = to - from + 1

    let pivot = from
    var firstLarge = -1
    for idx in from+1...to {
        if nums[idx] > nums[pivot] && firstLarge < 0 {
            firstLarge = idx
        } else if nums[idx] <= nums[pivot] && firstLarge > 0 {
            swap(&nums, idx, firstLarge)
            firstLarge += 1
        }
    }

    if firstLarge > 0 {
        swap(&nums, pivot, firstLarge-1)
    } else {
        swap(&nums, pivot, to)
    }

    if firstLarge < 0 { return (count-1, 0) }
    else { return (firstLarge-from-1, to-firstLarge+1) }
}

private func swap(_ nums: inout [Int], _ pos1: Int, _ pos2: Int) {
    let temp = nums[pos1]
    nums[pos1] = nums[pos2]
    nums[pos2] = temp
}


// The following code below is to use the concept of search tree
// after we build a search tree, we know how many nodes are at left and right
// then we will know the kth largest element is located at left or right
// then go to search for it, recursively.

//class KTreeNode {
//    var left: KTreeNode?
//    var right: KTreeNode?
//    var val: Int
//    var rightCount: Int
//
//    init(_ val: Int) {
//        self.val = val
//        self.rightCount = 0
//    }
//}
//
//func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//    guard k >= 1 else { return Int.min }
//    guard k <= nums.count else { return Int.min }
//    guard nums.count > 0 else { return Int.min }
//
//    let count = nums.count
//    let root = KTreeNode(nums[0])
//    for idx in 1..<nums.count {
//        insertTree(root, nums[idx])
//    }
//
//    if let node = findTree(root, k, count) {
//        return node.val
//    } else {
//        return Int.min
//    }
//}
//
//private func insertTree(_ root: KTreeNode?, _ val: Int) {
//    var prev: KTreeNode? = nil
//    var curr = root
//    var left = true
//    while(curr != nil) {
//        prev = curr
//        if val < curr!.val {
//            curr = curr!.left
//            left = true
//        } else {
//            curr?.rightCount += 1
//            curr = curr!.right
//            left = false
//        }
//    }
//
//    let node = KTreeNode(val)
//    if left { prev?.left = node }
//    else { prev?.right = node }
//}
//
//private func findTree(_ root: KTreeNode?, _ k: Int, _ total: Int) -> KTreeNode? {
//    guard let root = root else { return nil }
//    let rightCount = root.rightCount
//
//    if k <= rightCount {
//        return findTree(root.right, k, total-k)
//    } else if k == rightCount + 1 {
//        return root
//    } else {
//        return findTree(root.left, k-rightCount-1, total-rightCount-1)
//    }
//}
