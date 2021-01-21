//
//  0409.longestPalindrome.swift
//  AllProblems
//
//  Created by liuning on 2021/1/20.
//

import Foundation

//#include <string>
//#include <unordered_map>
//using namespace std;
//
//int longestPalindrome(string s) {
//    unordered_map<char, int> freq;
//    for (char c: s) {
//        freq[c]++;
//    }
//
//    int res = 0;
//    bool hasSingle = false;
//    for (auto p: freq) {
//        if (p.second%2 == 1) hasSingle = true;
//        res += (p.second/2)*2;
//    }
//
//    return hasSingle ? (res + 1) : res;
//}
