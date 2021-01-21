//
//  0354.maxEnvelopes.swift
//  AllProblems
//
//  Created by liuning on 2021/1/10.
//

import Foundation

//#include <vector>
//#include <algorithm>
//using namespace std;
//
//int findIdx(const vector<int> arrLIS, int val) {
//    int left = 0;
//    int right = arrLIS.size()-1;
//
//    while (left <= right) {
//        int mid = left + (right-left)/2;
//        if (arrLIS[mid] == val) {
//            return mid;
//        } else if (arrLIS[mid] > val) {
//            right = mid - 1;
//        } else {
//            left = mid + 1;
//        }
//    }
//    return left;
//}
//
//int calculateLIS(const vector<int>& v) {
//    vector<int> arrLIS;
//
//    for (int n: v) {
//        int idx = findIdx(arrLIS, n);
//        if (idx < arrLIS.size()) {
//            arrLIS[idx] = n;
//        } else {
//            arrLIS.push_back(n);
//        }
//    }
//
//    return arrLIS.size();
//}
//
//int maxEnvelopes(vector<vector<int>>& envelopes) {
//    sort(envelopes.begin(), envelopes.end(), [](const vector<int>& lhs, const vector<int>& rhs) {
//        if (lhs[0] < rhs[0]) return true;
//        else if (lhs[0] == rhs[0]) return lhs[1] > rhs[1];
//        else return false;
//    });
//
//    vector<int> heights;
//    for (const auto& v: envelopes) {
//        heights.push_back(v[1]);
//    }
//
//    return calculateLIS(heights);
//}
