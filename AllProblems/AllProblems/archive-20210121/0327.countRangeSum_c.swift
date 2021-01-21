//
//  0327.countRangeSum.swift
//  AllProblems
//
//  Created by liuning on 2021/1/9.
//

import Foundation

// https://leetcode-cn.com/problems/count-of-range-sum/solution/xian-ren-zhi-lu-ru-he-xue-xi-ke-yi-jie-jue-ben-ti-/

//#include <vector>
//#include <set>
//#include <unordered_map>
//using namespace std;
//
//class FenwickTree {
//public:
//    FenwickTree(int n): sum(vector<int64_t>(n+1, 0)) {}
//
//    void update(int n, int delta) {
//        while (n < sum.size()) {
//            sum[n] += delta;
//            n += lowbit(n);
//        }
//    }
//
//    int64_t query(int n) {
//        int res = 0;
//        while (n > 0) {
//            res += sum[n];
//            n -= lowbit(n);
//        }
//        return res;
//    }
//
//private:
//    int lowbit(int n) { return n&(-n); }
//
//private:
//    vector<int64_t> sum;
//};
//
//int countRangeSum(vector<int>& nums, int lower, int upper) {
//    vector<int64_t> presum(nums.size()+1, 0);
//    for (int i=0; i<nums.size(); i++) {
//        presum[i+1] = presum[i] + nums[i];
//    }
//
//    // wants:
//    //  - lower <= presum[j] - presum[i-1] <= upper
//    // which is:
//    //  - presum[i-1] >= presum[j] - upper
//    //  - presum[i-1] <= presum[j] - lower
//    // then, if we "fix" j, the problem becomes how many "i" we have, in order to have
//    //  - presum[i-1] in range [presum[j] - upper, presum[j] - lower]
//
//    // remember: element in set is ordered
//    set<int64_t> allNumbers;
//    for (int i=0; i<presum.size(); i++) {
//        allNumbers.insert(presum[i]);
//        allNumbers.insert(presum[i]-lower);
//        allNumbers.insert(presum[i]-upper);
//    }
//
//    int idx = 0;
//    unordered_map<int64_t, int> map;
//    for (const int64_t& n: allNumbers) {
//        map[n] = idx++;
//    }
//
//    int64_t res = 0;
//    FenwickTree tree(allNumbers.size());
//    for (int i=0; i<presum.size(); i++) {
//        int left = map[presum[i]-upper];
//        int right = map[presum[i]-lower];
//        res += tree.query(right+1) - tree.query(left);
//        tree.update(map[presum[i]]+1, 1);
//    }
//
//    return res;
//}
