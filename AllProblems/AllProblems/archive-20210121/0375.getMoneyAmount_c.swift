//
//  0375.getMoneyAmount.swift
//  AllProblems
//
//  Created by liuning on 2021/1/14.
//

import Foundation

//int getMoneyAmount(int n) {
//    vector<vector<int>> dp(n+1, vector<int>(n+1, 0));
//    for (int len=2; len<=n; len++) {
//        for (int start=1; start<=n-len+1; start++) {
//            // need to fill dp[start][start+len-1]
//            int res = INT32_MAX;
//            for (int pivot=start; pivot <= start+len-1; pivot++) {
//                int dp1 = start <= pivot-1 ? dp[start][pivot-1] : 0;
//                int dp2 = pivot+1 <= start+len-1 ? dp[pivot+1][start+len-1] : 0;
//                int val = pivot + max(dp1, dp2);
//                res = min(res, val);
//            }
//            dp[start][start+len-1] = res;
//        }
//    }
//    return dp[1][n];
//}
