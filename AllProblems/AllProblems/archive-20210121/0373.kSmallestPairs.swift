//
//  0373.kSmallestPairs.swift
//  AllProblems
//
//  Created by liuning on 2021/1/14.
//

import Foundation


//#include <vector>
//#include <queue>
//using namespace std;
//
//vector<vector<int>> kSmallestPairs(vector<int>& nums1, vector<int>& nums2, int k) {
//    using PII = pair<int, int>;
//    auto compare = [](const PII& a, const PII&b) { return a.first+a.second > b.first+b.second; };
//    priority_queue<PII, vector<PII>, decltype(compare)> pq(compare);
//
//    for (int i: nums1) {
//        for (int j: nums2) {
//            auto p = make_pair(i, j);
//            pq.push(p);
//        }
//    }
//
//    vector<vector<int>> res;
//    for (int i=0; i<k && !pq.empty(); i++) {
//        auto& p = pq.top();
//        res.emplace_back(vector<int>{p.first, p.second});
//        pq.pop();
//    }
//
//    return res;
//}
