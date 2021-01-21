//
//  0233.countDigitOne.swift
//  AllProblems
//
//  Created by liuning on 2020/12/29.
//

import Foundation

// https://leetcode-cn.com/problems/number-of-digit-one/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-50/

func countDigitOne(_ n: Int) -> Int {
    var count = 0
    var k = 1
    while k <= n {
        // xyzdabc
        let abc = n % k
        let xyzd = n / k
        let d = xyzd % 10
        let xyz = xyzd / 10

        if d == 0 {
            count += xyz*k
        } else if d == 1 {
            count += xyz*k + abc + 1
        } else {
            count += xyz*k + k
        }

        k *= 10
    }

    return count
}

////        <=9    <=99    <=999   <=9999
//// 个位    1      10      100     1000
//// 十位    0      10      100     1000
//// 百位    0      0       100     1000
//// 千位    0      0       0       1000
//
//func countDigitOne(_ n: Int) -> Int {
//    let res = calculateHelper(n)
//    return res
//}
//
//private func calculateHelper(_ n: Int) -> Int {
//    guard n > 0 else { return 0 }
//    if n <= 9 { return 1 }
//    let numLen = length(n)
//
//    let prevBase = pow(10, numLen-1)
//    let currBase = prevBase * 10
//
//    // prev: "满编的"前位
//    // curr: 当前位
//    // extra: "不满编的"前位
//    let prev = (n / currBase) * prevBase * (numLen-1)
//    let curr = min(n - currBase + 1, currBase)
//    let extra = calculateHelper(n % currBase)
//    let res = prev + curr + extra
//    return res
//}
//
//private func pow(_ base: Int, _ exp: Int) -> Int {
//    var res = 1
//    var exp = exp
//    while exp > 1 {
//        res = res*base
//        exp -= 1
//    }
//    return res
//}
//
//private func length(_ n: Int) -> Int {
//    guard n > 0 else { return 0 }
//    var numLen = 0
//    var temp = n
//    while temp > 0 {
//        temp = temp/10
//        numLen += 1
//    }
//    return numLen
//}
