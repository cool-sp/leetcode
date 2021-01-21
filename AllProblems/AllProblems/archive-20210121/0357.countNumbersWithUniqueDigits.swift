//
//  0357.countNumbersWithUniqueDigits.swift
//  AllProblems
//
//  Created by liuning on 2021/1/11.
//

import Foundation

//int helper(int n) {
//    int res = 9;
//    for (int i=0; i<n-1; i++) {
//        res *= (9-i);
//    }
//    return res;
//}
//
//int countNumbersWithUniqueDigits(int n) {
//    int m = min(n, 10);
//    if (m == 0) return 1;
//
//    int res = 1;
//    for (int i=1; i<=m; i++) {
//        res = res + helper(i);
//    }
//    return res;
//}
