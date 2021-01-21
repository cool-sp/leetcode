//
//  0318.maxProduct.swift
//  AllProblems
//
//  Created by liuning on 2021/1/7.
//

import Foundation

//#include <string>
//#include <vector>
//#include <algorithm>
//using namespace std;
//
//int convert(const string& str) {
//    int res = 0;
//    for (char c: str) {
//        res |= 1 << (c-'a');
//    }
//    return res;
//}
//
//int maxProduct(vector<string>& words) {
//    vector<int> fingerPrint;
//    for (const auto& str: words) {
//        fingerPrint.push_back(convert(str));
//    }
//
//    int res = 0;
//    for (int i=0; i<words.size(); i++) {
//        for (int j=i+1; j<words.size(); j++) {
//            if ((fingerPrint[i] & fingerPrint[j]) == 0) {
//                res = max(res, int(words[i].size()*words[j].size()));
//            }
//        }
//    }
//
//    return res;
//}
