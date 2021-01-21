//
//  0313.nthSuperUglyNumber.swift
//  AllProblems
//
//  Created by liuning on 2021/1/7.
//

import Foundation

//#include <vector>
//using namespace std;
//
//int nthSuperUglyNumber(int n, vector<int>& primes) {
//    const int N = primes.size();
//    vector<int> index(N, 0);
//    vector<int> res(n, 0);
//
//    res[0] = 1;
//    for (int i=1; i<n; i++) {
//        int minVal = INT32_MAX;
//        for (int j=0; j<N; j++) {
//            int currVal = res[index[j]]*primes[j];
//            if (currVal < minVal) {
//                minVal = currVal;
//            }
//        }
//
//        for (int j=0; j<N; j++) {
//            if (minVal == res[index[j]]*primes[j]) {
//                index[j]++;
//            }
//        }
//        res[i] = minVal;
//    }
//
//    return res[n-1];
//}
