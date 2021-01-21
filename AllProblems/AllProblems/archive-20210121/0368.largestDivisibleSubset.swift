//
//  0368.largestDivisibleSubset.swift
//  AllProblems
//
//  Created by liuning on 2021/1/13.
//

import Foundation

//#include <vector>
//#include <algorithm>
//using namespace std;
//
//vector<int> largestDivisibleSubset(vector<int>& nums) {
//    const int N = nums.size();
//    sort(nums.begin(), nums.end());
//
//    int maxIdx = -1;
//    int maxLen = 0;
//    vector<int> dp(N, 0);
//    for (int i=0; i<nums.size(); i++) {
//        int len = 0;
//        for (int j=0; j<i; j++) {
//            if (nums[i] % nums[j] == 0) {
//                len = max(len, dp[j]);
//            }
//        }
//        dp[i] = len + 1;
//        if (dp[i] > maxLen) {
//            maxIdx = i;
//            maxLen = dp[i];
//        }
//    }
//
//    vector<int> res;
//    res.push_back(nums[maxIdx]);
//    int prevVal = nums[maxIdx];
//    int expectLen = maxLen-1;
//    for (int i=maxIdx-1; i>=0; i--) {
//        if (dp[i] == expectLen && prevVal % nums[i] == 0) {
//            res.push_back(nums[i]);
//            prevVal = nums[i];
//            expectLen--;
//        }
//    }
//
//    return vector<int>(res.crbegin(), res.crend());
//}
