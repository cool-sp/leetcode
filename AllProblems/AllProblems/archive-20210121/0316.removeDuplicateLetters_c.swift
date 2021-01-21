//
//  0316.removeDuplicateLetters.swift
//  AllProblems
//
//  Created by liuning on 2021/1/7.
//

import Foundation

//#include <string>
//#include <deque>
//#include <vector>
//using namespace std;
//
//string removeDuplicateLetters(string s) {
//    deque<char> res;
//    vector<int> lastIdx(26, -1);
//    vector<bool> contains(26, false);
//
//    for (int i = 0; i < s.size(); i++) {
//        lastIdx[s[i] - 'a'] = i;
//    }
//
//    for (int i = 0; i< s.size(); i++) {
//        if (contains[s[i] - 'a']) continue;
//
//        while (!res.empty() && s[i] < res.back() && lastIdx[res.back() - 'a'] > i) {
//            char top = res.back();
//            res.pop_back();
//            contains[top - 'a'] = false;
//        }
//
//        res.push_back(s[i]);
//        contains[s[i] - 'a'] = true;
//    }
//
//    return string(res.begin(), res.end());
//}
