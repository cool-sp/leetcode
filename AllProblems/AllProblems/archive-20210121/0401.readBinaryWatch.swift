//
//  0401.readBinaryWatch.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

//#include <vector>
//#include <string>
//#include <unordered_map>
//using namespace std;
//
//int countOfOne(int num) {
//    int res = 0;
//    while (num > 0) {
//        num &= num - 1;
//        res += 1;
//    }
//    return res;
//}
//
//string toHour(int n) {
//    return to_string(n);
//}
//
//string toMin(int n) {
//    if (n==0) return "00";
//    else if (n<=9) return "0" + to_string(n);
//    else return to_string(n);
//}
//
//vector<string> readBinaryWatch(int num) {
//    if (num < 0) return {};
//    if (num > 10) return {};
//
//    unordered_map<int, vector<int>> hours;
//    for (int i=0; i<=11; ++i) {
//        hours[countOfOne(i)].push_back(i);
//    }
//
//    unordered_map<int, vector<int>> minutes;
//    for (int i=0; i<=59; i++) {
//        minutes[countOfOne(i)].push_back(i);
//    }
//
//    vector<string> res;
//    for (int i=0; i<=num; i++) {
//        int hourCnt = i;
//        int minuteCnt = num - i;
//
//        vector<int>& hs = hours[hourCnt];
//        vector<int>& ms = minutes[minuteCnt];
//
//        for (int h: hs) {
//            for (int m: ms) {
//                res.emplace_back(toHour(h) + ":" + toMin(m));
//            }
//        }
//    }
//    return res;
//}
