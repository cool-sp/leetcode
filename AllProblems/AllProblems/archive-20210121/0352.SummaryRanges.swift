//
//  0352.SummaryRanges.swift
//  AllProblems
//
//  Created by liuning on 2021/1/10.
//

import Foundation

//#include <vector>
//using namespace std;
//
//class SummaryRanges {
//    vector<vector<int>> res;
//
//public:
//    SummaryRanges() {}
//
//    void addNum(int val) {
//        if (res.empty()) {
//            res.emplace_back(vector<int>({val, val}));
//            return;
//        }
//
//        int mergeIdx = -1;
//        int left = 0;
//        int right = res.size()-1;
//        while (left <= right) {
//            int mid = left + (right-left)/2;
//            vector<int>& midVal = res[mid];
//            if (midVal[0] <= val && midVal[1] >= val) {
//                return; // contains
//            } else if (midVal[0] == val + 1) {
//                midVal[0] = val;
//                mergeIdx = mid > 0 ? mid - 1 : 0;
//                break; // update left edge
//            } else if (midVal[1] == val - 1) {
//                midVal[1] = val;
//                mergeIdx = mid;
//                break; // update right edge
//            } else if (midVal[1] < val) {
//                left = mid + 1;
//            } else {
//                right = mid - 1;
//            }
//        }
//
//        if (mergeIdx < 0) {
//            res.insert(res.begin()+left, vector<int>({val, val}));
//        } else {
//            int startMergeIdx = mergeIdx;
//            while (startMergeIdx < res.size()-1) {
//                if (res[startMergeIdx][1] == res[startMergeIdx+1][0] - 1) {
//                    startMergeIdx++;
//                } else {
//                    break;
//                }
//            }
//
//            res[mergeIdx][1] = res[startMergeIdx][1];
//            int mergeCount = startMergeIdx - mergeIdx;
//            res.erase(res.begin()+mergeIdx+1, res.begin()+mergeIdx+1+mergeCount);
//        }
//    }
//
//    vector<vector<int>> getIntervals() {
//        return res;
//    }
//};
