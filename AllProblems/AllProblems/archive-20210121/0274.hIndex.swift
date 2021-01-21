//
//  0274.hIndex.swift
//  AllProblems
//
//  Created by liuning on 2020/12/31.
//

import Foundation

//#include <vector>
//#include <algorithm>
//using namespace std;
//
//int hIndex(vector<int>& citations) {
//    sort(citations.begin(), citations.end());
//    int N = citations.size();
//
//    int left = 0;
//    int right = N-1;
//    while(left <= right) {
//        int mid = left + (right-left)/2;
//        if (citations[mid] <= N-mid) {
//            left = mid + 1;
//        } else {
//            right = mid - 1;
//        }
//    }
//
//    int lval = N - left;
//    int rval = right < 0 ? 0 : citations[right];
//    return max(rval, lval);
//}
