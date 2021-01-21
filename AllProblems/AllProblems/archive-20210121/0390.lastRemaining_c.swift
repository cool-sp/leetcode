//
//  0390.lastRemaining.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

// https://www.jianshu.com/p/6ee5c7b21333
// https://leetcode-cn.com/problems/elimination-game/solution/mei-ri-suan-fa-day-85-tu-jie-suan-fa-yi-xing-dai-m/

func lastRemaining(_ n: Int) -> Int {
    if n == 1 { return 1 }
    else { return 2 * (n/2 + 1 - lastRemaining(n/2)) }
}
