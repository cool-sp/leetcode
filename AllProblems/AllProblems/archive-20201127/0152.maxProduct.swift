//
//  0152.maxProduct.swift
//  AllProblems
//
//  Created by liuning on 2020/11/25.
//

import Foundation


func maxProduct(_ nums: [Int]) -> Int {
    // it's a DP problem
    // let's define:
    // fmin(i) is the min value of product at index i (actually it is negative value)
    // fmax(i) is the max value of product at index i
    // then:
    //    - fmax(i) = max(fmin(i-1)*nums[i], fmax(i-1)*nums[i], nums[i])
    //    - fmin(i) = min(fmin(i-1)*nums[i], fmax(i-1)*nums[i], nums[i])

    if nums.count <= 0 { return Int.min }

    var fmin = Array(repeating: 0, count: nums.count+1)
    var fmax = Array(repeating: 0, count: nums.count+1)

    fmin[0] = 1
    fmax[0] = 1

    for i in 1...nums.count {
        fmin[i] = min(min(fmin[i-1]*nums[i-1], fmax[i-1]*nums[i-1]), nums[i-1])
        fmax[i] = max(max(fmin[i-1]*nums[i-1], fmax[i-1]*nums[i-1]), nums[i-1])
    }

    var result = Int.min
    for i in 1...nums.count {
        result = max(result, fmax[i])
    }

    return result
}


// The basic idea below is to split string into several substrings, with zero
// for example, (...) 0 (...) 0 (...)
// we will have 3 substrings, and for each string, there is no zero inside
// then we check the minus value for each substring
// say,
// - if we have two (even) negative values (..1..) M (..2..) M (..3..)
//   the max product result is the while part
// - if we have three (odd) negative values (..1..) M (..2..) M (..3..) M (..4..)
//   the max product result is max(stirng1+string2+string3, string2+string3+string4)

//func maxProduct(_ nums: [Int]) -> Int {
//    guard nums.count >= 1 else { return Int.min }
//
//    var maxVal = Int.min
//    var from = 0
//    var meetZero = false
//    for i in 0..<nums.count {
//        if nums[i] == 0 && !meetZero {
//            maxVal = max(0, max(maxVal, calculateWithoutZero(nums, from, i-1)))
//            meetZero = true
//        } else if nums[i] != 0 && meetZero {
//            from = i
//            meetZero = false
//        }
//    }
//
//    maxVal = max(maxVal, calculateWithoutZero(nums, from, nums.count-1))
//    return maxVal
//}
//
//private func calculateWithoutZero(_ nums: [Int], _ from: Int, _ to: Int) -> Int {
//    guard nums.count >= 1 else { return Int.min }
//    guard from >= 0 && from <= to else { return Int.min }
//    guard to < nums.count else { return Int.min }
//
//    if from == to { return nums[from] }
//
//    var firstMinusIdx = -1
//    var lastMinusIdx = -1
//    var countOfMinus = 0
//
//    for i in from...to {
//        if nums[i] < 0 {
//            if firstMinusIdx < 0 {
//                firstMinusIdx = i
//            }
//            lastMinusIdx = i
//            countOfMinus += 1
//        }
//    }
//
//    if countOfMinus % 2 == 0 {
//        return multiply(nums, from, to)
//    } else {
//        let candidate1 = multiply(nums, from, lastMinusIdx-1)
//        let candidate2 = multiply(nums, firstMinusIdx+1, to)
//        return max(candidate1, candidate2)
//    }
//}
//
//private func multiply(_ nums: [Int], _ from: Int, _ to: Int) -> Int {
//    guard from >= 0 else { return Int.min }
//    guard to < nums.count else { return Int.min }
//    guard from <= to else { return Int.min }
//
//    var idx = from
//    var result = 1
//    while(idx <= to) {
//        result *= nums[idx]
//        idx += 1
//    }
//    return result
//}
