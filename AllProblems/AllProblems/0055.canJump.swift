//
//  canJump.swift
//  AllProblems
//
//  Created by liuning on 2020/11/20.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    if nums.count <= 0 { return false }
    if nums.count == 1 { return true }

    // basic ideas:
    // if all numbers > 0, means we can reach the end
    // the problem is zero, which may block the path
    // so if wen can find a path that can jump over that zero
    // then we can reach to the end
    // and if there are multiple zeroes, we need to flag the "blocking" one
    var zeroIdx = -1
    var revIdx = nums.count - 1
    while(revIdx >= 0) {
        if zeroIdx < 0                       // there is no "blocking" zero now
            && nums[revIdx] == 0             // we may find one blocking zero
            && revIdx != nums.count - 1 {    // and it's not the final node

            zeroIdx = revIdx
        } else if zeroIdx > 0                       // there is a "blocking" zero
            && nums[revIdx] + revIdx > zeroIdx {    // but soon we found we can jump it over

            zeroIdx = -1                            // then mark it as non-blocking
        }

        revIdx -= 1
    }

    return zeroIdx < 0
}
