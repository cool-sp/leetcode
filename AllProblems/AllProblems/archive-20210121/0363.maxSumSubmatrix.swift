//
//  0363.maxSumSubmatrix.swift
//  AllProblems
//
//  Created by liuning on 2021/1/12.
//

import Foundation

//int maxSum(const vector<int>& v, int limit) {
//    int res = INT32_MIN;
//    int maxSum = 0;
//    for (int i=0; i<v.size(); i++) {
//        maxSum = max(maxSum+v[i], v[i]);
//        res = max(res, maxSum);
//    }
//    if (res <= limit) return res;
//
//    res = INT32_MIN;
//    for (int i=0; i<v.size(); i++) {
//        int sum = 0;
//        for (int j=i; j<v.size(); j++) {
//            sum += v[j];
//            if (sum > res && sum <= limit) res = sum;
//            if (res == limit) return res;
//        }
//    }
//    return res;
//}
//
//int maxSumSubmatrix(vector<vector<int>>& matrix, int k) {
//    int rowCnt = matrix.size();
//    int colCnt = matrix[0].size();
//
//    int res = INT32_MIN;
//    for (int c1 = 0; c1 < colCnt; c1++) {
//        vector<int> rowSum(rowCnt, 0);
//        for (int c2 = c1; c2 < colCnt; c2++) {
//            for (int r = 0; r < rowCnt; r++) {
//                rowSum[r] += matrix[r][c2];
//            }
//            res = max(res, maxSum(rowSum, k));
//        }
//    }
//
//    return res;
//}
