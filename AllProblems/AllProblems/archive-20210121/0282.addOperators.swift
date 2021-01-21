//
//  0282.addOperators.swift
//  AllProblems
//
//  Created by liuning on 2021/1/2.
//

import Foundation

//#include <vector>
//#include <string>
//using namespace std;
//
//void backtrace(const string& num, int pos, const string& path, long accumulated, long prev, int target, vector<string>& res) {
//    // "accumulated" + "prev" (+/-/*) "curr"
//    // curr starts from pos
//    if (pos >= num.size()) {
//        if (accumulated + prev == target) {
//            res.emplace_back(path);
//        }
//        return;
//    }
//
//    int N = num.size() - pos;
//    long curr = 0;
//    for (int i = 0; i < N; ++i) {
//        if (curr == 0 && i == 1) break; // skip the case of leading zero
//
//        curr = curr*10 + num[pos+i] - '0';
//        string currStr = num.substr(pos, i+1);
//
//        if (pos == 0) {
//            // for "+"
//            backtrace(num, pos+i+1, currStr, 0, curr, target, res);
//        } else {
//            // for "+"
//            backtrace(num, pos + i + 1, path + "+" + currStr, accumulated + prev, curr, target, res);
//            // for "-"
//            backtrace(num, pos + i + 1, path + "-" + currStr, accumulated + prev, -curr, target, res);
//            // for "*"
//            backtrace(num, pos + i + 1, path + "*" + currStr, accumulated, prev * curr, target, res);
//        }
//    }
//}
//
//vector<string> addOperators(const string& num, int target) {
//    vector<string> res;
//    backtrace(num, 0, "", 0, 0, target, res);
//    return std::move(res);
//}
