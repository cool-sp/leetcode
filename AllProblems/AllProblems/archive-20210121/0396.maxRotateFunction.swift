//
//  0396.maxRotateFunction.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

//#include <vector>
//using namespace std;
//
//int maxRotateFunction(vector<int>& A) {
//    // f(k) = f(k-1) - sum + n*A[k-1]
//
//    int64_t f = 0;
//    int64_t sum = 0;
//    for (int i=0; i<A.size(); ++i) {
//        sum += A[i];
//        f += i*A[i];
//    }
//
//    int64_t res = f;
//    for (int i=1; i<A.size(); ++i) {
//        int64_t temp = f - sum + A.size()*A[i-1];
//        res = max(res, temp);
//        f = temp;
//    }
//
//    return res;
//}
