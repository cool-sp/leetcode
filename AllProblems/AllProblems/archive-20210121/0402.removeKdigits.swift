//
//  0402.removeKdigits.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

//#include <string>
//#include <vector>
//using namespace std;
//
//string removeKdigits(string num, int k) {
//    if (k <= 0) return num;
//    if (k >= num.size()) return "0";
//
//    vector<char> res;
//    for (char c: num) {
//        if (res.empty() || c >= res.back() || k == 0) {
//            res.push_back(c);
//        } else {
//            while (!res.empty() && k > 0 && c < res.back()) {
//                k--;
//                res.pop_back();
//            }
//            res.push_back(c);
//        }
//    }
//    if (k > 0) {
//        res.erase(res.end()-k, res.end());
//    }
//
//    res.erase(res.begin(), find_if(res.begin(), res.end(), [](char c) { return c != '0'; }));
//    if (res.empty()) return "0";
//    else return string(res.begin(), res.end());
//}
