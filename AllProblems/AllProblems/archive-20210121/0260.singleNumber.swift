//
//  0260.singleNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/12/30.
//

import Foundation

// https://leetcode-cn.com/problems/single-number-iii/solution/cai-yong-fen-zhi-de-si-xiang-jiang-wen-ti-jiang-we/

//#include <vector>
//using namespace std;
//
//vector<int> singleNumber(vector<int>& nums) {
//    unsigned int vxor = 0;
//    for (int i=0; i<nums.size(); ++i) {
//        vxor ^= nums[i];
//    }
//
//    unsigned int mask = vxor&(-vxor);
//    vector<int> res = {0, 0};
//    for (int i=0; i<nums.size(); ++i) {
//        if (mask & nums[i]) {
//            res[0] ^= nums[i];
//        } else {
//            res[1] ^= nums[i];
//        }
//    }
//
//    return res;
//}
