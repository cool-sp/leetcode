//
//  0239.maxSlidingWindow.swift
//  AllProblems
//
//  Created by liuning on 2020/11/27.
//

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count >= k else { return [] }
    guard k > 0 else { return [] }
    if k == 1 { return nums }

    var slidingWindow = [Int]()
    var answer = [Int]()

    for i in 0..<nums.count {
        if i >= k && slidingWindow[0] == i-k {
            slidingWindow.removeFirst()
        }

        var j = slidingWindow.count - 1
        while(j >= 0) {
            if nums[slidingWindow[j]] <= nums[i] {
                slidingWindow.removeLast()
            } else {
                break
            }
            j -= 1
        }

        slidingWindow.append(i)

        if i >= k-1 {
            answer.append(nums[slidingWindow[0]])
        }
    }

    return answer
}
