//
//  0376.wiggleMaxLength.swift
//  AllProblems
//
//  Created by liuning on 2021/1/14.
//

import Foundation

//#include <vector>
//using namespace std;
//
//int wiggleMaxLength(vector<int>& nums) {
//    if (nums.empty()) return 0;
//
//    vector<int> dp_up(nums.size(), 0);
//    vector<int> dp_down(nums.size(), 0);
//    dp_up[0] = 1;
//    dp_down[0] = 1;
//
//    for (int i=1; i<nums.size(); i++) {
//        if (nums[i] > nums[i-1]) {
//            dp_up[i] = max(dp_up[i-1], dp_down[i-1]+1);
//            dp_down[i] = dp_down[i-1];
//        } else if (nums[i] < nums[i-1]) {
//            dp_down[i] = max(dp_down[i-1], dp_up[i-1]+1);
//            dp_up[i] = dp_up[i-1];
//        } else {
//            dp_up[i] = dp_up[i-1];
//            dp_down[i] = dp_down[i-1];
//        }
//    }
//
//    const int N = nums.size();
//    return max(dp_up[N-1], dp_down[N-1]);
//}
