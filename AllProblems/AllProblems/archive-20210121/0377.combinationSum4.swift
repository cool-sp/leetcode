//
//  0377.combinationSum4.swift
//  AllProblems
//
//  Created by liuning on 2021/1/14.
//

import Foundation

//#include <vector>
//#include <unordered_map>
//using namespace std;
//
//int helper(vector<int>& nums, int target, unordered_map<int, int>& memory) {
//    if (memory.count(target) > 0) {
//        return memory[target];
//    }
//
//    int res = 0;
//    for (int i=0; i<nums.size(); i++) {
//        if (target > nums[i]) {
//            res += helper(nums, target-nums[i], memory);
//        } else if (target == nums[i]) {
//            res++;
//        }
//    }
//    memory[target] = res;
//    return res;
//}
//
//int combinationSum4(vector<int>& nums, int target) {
//    unordered_map<int, int> memory;
//    return helper(nums, target, memory);
//}
