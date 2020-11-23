//
//  0011.maxArea.swift
//  AllProblems
//
//  Created by liuning on 2020/11/19.
//

import Foundation

func maxArea(_ height: [Int]) -> Int {
    guard height.count > 0 else { return 0 }

    var maxAreaVal = 0
    var i = 0
    var j = height.count - 1

    while(i<j) {
        let areaVal = (j-i) * min(height[i], height[j])
        maxAreaVal = max(maxAreaVal, areaVal)

        if height[i] > height[j] {
            j -= 1
        } else {
            i += 1
        }
    }

    return maxAreaVal
}
