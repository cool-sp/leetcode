//
//  0319.bulbSwitch.swift
//  AllProblems
//
//  Created by liuning on 2021/1/7.
//

import Foundation

// https://leetcode-cn.com/problems/bulb-switcher/solution/wei-shi-yao-ping-fang-shu-yi-ding-shi-liang-zhao-d/
func bulbSwitch(_ n: Int) -> Int {
    if n < 0 { return 0}

    var res = 0
    while (res+1)*(res+1) <= n {
        res += 1
    }

    return res
}
