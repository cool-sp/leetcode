//
//  0393.validUtf8.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation


//#include <vector>
//using namespace std;
//
//int countOfLeadingZero(int num) {
//    int n = num & 0xff;
//    int res = 0;
//
//    int mask = 128;
//    while (mask > 0) {
//        if (n & mask) {
//            res++;
//            mask >>= 1;
//        } else break;
//    }
//
//    return res;
//}
//
//bool validUtf8(vector<int>& data) {
//    if (data.empty()) return false;
//
//    int offset = 0;
//    while (offset < data.size()) {
//        int first = data[offset];
//        int len = countOfLeadingZero(first);
//
//        if (len == 0) { offset++; continue; }
//        if (len == 1) return false;
//        if (len > 4) return false;
//        if (data.size() - offset < len) return false;
//
//        for (int i=offset+1; i<offset+len; ++i) {
//            if (countOfLeadingZero(data[i]) != 1) return false;
//        }
//        offset += len;
//    }
//
//    return true;
//}
