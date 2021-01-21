//
//  0413.numberOfArithmeticSlices.swift
//  AllProblems
//
//  Created by liuning on 2021/1/21.
//

import Foundation

//#include <vector>
//using namespace std;
//
//int numberOfArithmeticSlices(vector<int>& A) {
//    int distance = 0;
//    int lhs = 0;
//    int rhs = lhs + 1;
//
//    int res = 0;
//    while (rhs < A.size()) {
//        int newDistance = A[rhs] - A[rhs-1];
//        if (newDistance != distance) {
//            res += (rhs-lhs-1)*(rhs-lhs-2)/2;
//            distance = newDistance;
//            lhs = rhs - 1;
//        }
//        rhs++;
//    }
//    res += (rhs-lhs-1)*(rhs-lhs-2)/2;
//    return res;
//}
