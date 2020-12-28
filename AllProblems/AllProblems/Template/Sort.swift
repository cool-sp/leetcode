//
//  Sort.swift
//  AllProblems
//
//  Created by liuning on 2020/12/14.
//

import Foundation

// https://leetcode-cn.com/problems/sort-an-array/
func sortArray912(_ nums: [Int]) -> [Int] {
    var nums = nums
    // quick sort
//    quickSort(&nums, 0, nums.count-1)
//    return nums

    // heap sort
//    heapSort912(&nums)
//    return nums

    // merge sort
//    var temp = Array(repeating: 0, count: nums.count)
//    mergeSort(&nums, &temp, 0, nums.count-1)
//    return nums

    // radix sort
    return radixSort(nums)
}

private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}


// MARK: quick sort
private func particition(_ nums: inout [Int], _ from: Int, _ to: Int) -> Int {
    // optional: random element
    let randomIdx = Int.random(in: from...to)
    swap(&nums, randomIdx, to)

    let pivot = to
    var i = from
    var j = from
    while j < to {
        if nums[j] <= nums[pivot] {
            swap(&nums, i, j)
            i += 1
            j += 1
        } else {
            j += 1
        }
    }

    swap(&nums, i, pivot)
    return i
}

private func quickSort(_ nums: inout [Int], _ from: Int, _ to: Int) {
    guard from <= to else { return }

    let pos = particition(&nums, from, to)
    quickSort(&nums, from, pos-1)
    quickSort(&nums, pos+1, to)
}

// MARK: heap sort
private extension Int {
    var parent: Int {
        return (self - 1 ) / 2
    }

    var leftChild: Int {
        return (self * 2) + 1
    }

    var rightChild: Int {
        return (self * 2) + 2
    }
}

private func heapifyDown(_ nums: inout [Int], _ from: Int, _ to: Int) {
    var leftChild = from.leftChild
    var rightChild = from.rightChild
    var maxIdx = from
    var currIdx = from

    while leftChild <= to {
        if nums[leftChild] > nums[maxIdx] {
            maxIdx = leftChild
        }

        if rightChild <= to && nums[rightChild] > nums[maxIdx] {
            maxIdx = rightChild
        }

        if currIdx == maxIdx { break }

        swap(&nums, maxIdx, currIdx)
        currIdx = maxIdx
        leftChild = currIdx.leftChild
        rightChild = currIdx.rightChild
    }
}

private func heapSort912(_ nums: inout [Int]) {
    // build max heap first
    for i in stride(from: (nums.count-1).parent, to: -1, by: -1) {
        heapifyDown(&nums, i, nums.count-1)
    }

    for i in stride(from: nums.count-1, to: 0, by: -1) {
        swap(&nums, 0, i)
        heapifyDown(&nums, 0, i-1)
    }
}

// MARK: merge sort
private func mergeSort(_ nums: inout [Int], _ temp: inout [Int], _ from: Int, _ to: Int) {
    guard from < to else { return }

    let mid = from + (to - from ) / 2
    mergeSort(&nums, &temp, from, mid)
    mergeSort(&nums, &temp, mid+1, to)

    var i = from
    var j = mid + 1
    var offset = from

    while i <= mid && j <= to {
        if nums[i] < nums[j] {
            temp[offset] = nums[i]
            i += 1
        } else {
            temp[offset] = nums[j]
            j += 1
        }

        offset += 1
    }

    while i <= mid {
        temp[offset] = nums[i]

        i += 1
        offset += 1
    }

    while j <= to {
        temp[offset] = nums[j]

        j += 1
        offset += 1
    }

    for idx in from...to {
        nums[idx] = temp[idx]
    }
}

// MARK: - radix sort
func radixSort(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    var nums = nums

    // in order to handle the nagative number
    // we also need to consider the min value (if it's negative)
    var min = Int.max
    var max = Int.min
    for num in nums {
        if num > max { max = num }
        if num < min { min = num }
    }
    var absMax = Swift.max(abs(min), abs(max))

    var nbucket = Array(repeating: [Int](), count: 10) // nagative bucket
    var pbucket = Array(repeating: [Int](), count: 10) // positive bucket

    var base = 1
    while absMax > 0 {
        for num in nums {
            let idx = abs((num / base) % 10)
            if num < 0 {
                nbucket[idx].append(num)
            } else {
                pbucket[idx].append(num)
            }
        }

        var i = 0

        // careful: for negative number, the bucket is reversed ...
        for idx in stride(from: 9, to: -1, by: -1) {
            for item in nbucket[idx] {
                nums[i] = item
                i += 1
            }
            nbucket[idx] = []
        }

        for idx in 0..<10 {
            for item in pbucket[idx] {
                nums[i] = item
                i += 1
            }
            pbucket[idx] = []
        }

        base *= 10
        absMax /= 10
    }

    return nums
}
