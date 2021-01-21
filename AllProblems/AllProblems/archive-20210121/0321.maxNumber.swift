//
//  0321.maxNumber.swift
//  AllProblems
//
//  Created by liuning on 2021/1/8.
//

import Foundation

//#include <vector>
//#include <deque>
//using namespace std;
//
//vector<int> maxNumberOfK(const vector<int>& nums, int k) {
//    deque<int> res;
//    int canDrop = nums.size() - k;
//    for (int i=0; i<nums.size(); ++i) {
//        while(!res.empty() && nums[i] > res.back() && canDrop > 0) {
//            canDrop--;
//            res.pop_back();
//        }
//        res.push_back(nums[i]);
//    }
//    return vector<int>(res.begin(), res.begin()+k);
//}
//
//vector<int> mergeMaxNumber(const vector<int>& nums1, const vector<int>& nums2) {
//    vector<int> res(nums1.size()+nums2.size(), 0);
//    auto s1 = nums1.cbegin();
//    auto e1 = nums1.cend();
//    auto s2 = nums2.cbegin();
//    auto e2 = nums2.cend();
//
//    int idx = 0;
//    while (s1 != e1 || s2 != e2) {
//        res[idx++] = lexicographical_compare(s1, e1, s2, e2) ? *s2++ : *s1++;
//    }
//    return res;
//}
//
//vector<int> maxNumber(vector<int>& nums1, vector<int>& nums2, int k) {
//    vector<int> res(k, 0);
//    for (int i=0; i<=k; ++i) {
//        int k1 = i;
//        int k2 = k - i;
//
//        if (k1 > nums1.size() || k2 > nums2.size()) continue;
//
//        vector<int> v1 = maxNumberOfK(nums1, k1);
//        vector<int> v2 = maxNumberOfK(nums2, k2);
//        vector<int> merged = mergeMaxNumber(v1, v2);
//        res = max(res, merged);
//    }
//
//    return res;
//}
