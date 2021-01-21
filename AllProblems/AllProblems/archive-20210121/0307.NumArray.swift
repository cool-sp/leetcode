//
//  0307.NumArray.swift
//  AllProblems
//
//  Created by liuning on 2021/1/6.
//

import Foundation

// This is a problem of FenwickTree

//#include <vector>
//using namespace std;
//
//class NumArray {
//public:
//    NumArray(vector<int>& nums): sum(vector<int>(nums.size()+1, 0)), nums(vector<int>(nums.size(), 0)) {
//        for (int i = 0; i<nums.size(); i++) {
//            update(i, nums[i]);
//        }
//    }
//
//    void update(int i, int val) {
//        int delta = val - nums[i];
//        nums[i] = val;
//
//        int j = i + 1;
//        while (j < sum.size()) {
//            sum[j] += delta;
//            j += lowbit(j);
//        }
//    }
//
//    int sumRange(int i, int j) {
//        return query(j) - query(i-1);
//    }
//
//private:
//    int lowbit(int x) {
//        return x & (-x);
//    }
//
//    int query(int i) {
//        int res = 0;
//
//        int j = i + 1;
//        while (j > 0) {
//            res += sum[j];
//            j -= lowbit(j);
//        }
//        return res;
//    }
//
//private:
//    vector<int> sum;
//    vector<int> nums;
//};
