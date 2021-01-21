//
//  0400.findNthDigit.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

//#include <cmath>
//using namespace std;
//
//int findNthDigit(int n) {
//    int digitCnt = 1;
//    int64_t maxCount = digitCnt*pow(10, digitCnt-1)*9;
//
//    while ((int64_t)n > maxCount) {
//        n -= maxCount;
//        digitCnt++;
//        maxCount = digitCnt*pow(10, digitCnt-1)*9;
//    }
//
//    int base = pow(10, digitCnt-1);
//    int offset = (n-1)/digitCnt;
//    int number = base + offset;
//
//    int toRemoveAtRight = digitCnt - (n-1)%digitCnt - 1;
//    while (toRemoveAtRight > 0) {
//        number /= 10;
//        toRemoveAtRight--;
//    }
//
//    return number % 10;
//}
