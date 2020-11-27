//
//  0268.missingNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func missingNumber(_ nums: [Int]) -> Int {
    // leverage XOR
    // A ^ A = 0
    // A ^ 0 = A
    // do the XOR on all idx and nums[idx]
    // the remaing part is the missing number
    var missing = nums.count

    for i in 0..<nums.count {
        missing = missing ^ i ^ nums[i]
    }

    return missing
}


func missingNumber2(_ nums: [Int]) -> Int {
    // calculate the sum
    // in order to protect from overflow, do the minus immediately
    if nums.count <= 0 { return 0 }

    var sum = 0
    for i in 1...nums.count {
        sum += i
        sum -= nums[i-1]
    }

    return sum
}


//func missingNumber(_ nums: [Int]) -> Int {
//    var nums = nums
//    let count = nums.count
//
//    var overflow = 0
//    for i in 0..<count {
//        if abs(nums[i]) >= count { overflow = -1 }
//        else { nums[abs(nums[i])] = -nums[abs(nums[i])] }
//    }
//
//    if overflow >= 0 { return count }
//
//    var idxOfZero = -1
//    for idx in 0..<count {
//        if nums[idx] == 0 { idxOfZero = idx }
//        else if nums[idx] > 0 { return idx }
//    }
//    return idxOfZero
//}
