//
//  FenwickTree.swift
//  AllProblems
//
//  Created by liuning on 2020/12/1.
//

import Foundation

// https://www.youtube.com/watch?v=WbafSgetDDk
//class FenwickTree {
//    var sum: [Int]
//
//    init(_ n: Int) {
//        sum = Array(repeating: 0, count: n+1)
//    }
//
//    func update(_ i: Int, _ delta: Int) {
//        var i = i
//        while(i < sum.count) {
//            sum[i] += delta
//            i += lowbit(i)
//        }
//    }
//
//    func query(_ i: Int) -> Int {
//        var res = 0
//        var i = i
//        while (i > 0) {
//            res += sum[i]
//            i -= lowbit(i)
//        }
//        return res
//    }
//
//    private func lowbit(_ i: Int) -> Int {
//        return i & (-i)
//    }
//}
