//
//  0238.productExceptSelf.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    // ...L ... (M) ...R...
    // if we want to calculate M, we just need to calculate the result of L*R
    // let's define:
    // L(0) = 1
    // L(i) = L(i-1)*nums(i-1)
    // R(n-1) = 1
    // R(j) = R(j+1)*nums(j+1)
    // then we will know the answer, for idex i, the answer is L(i)*R(i)
    guard nums.count > 0 else { return [] }
    var answer = Array(repeating: 0, count: nums.count)

    answer[0] = 1
    for i in 1..<nums.count {
        answer[i] = answer[i-1] * nums[i-1]
    }

    var r = 1
    for j in stride(from: nums.count-1, to: -1, by: -1) {
        answer[j] = answer[j]*r
        r = r*nums[j]
    }

    return answer
}
