//
//  0241.diffWaysToCompute.swift
//  AllProblems
//
//  Created by liuning on 2020/12/29.
//

import Foundation

//#include <iostream>
//#include <string>
//#include <vector>
//#include <unordered_map>
//using namespace std;
//
//vector<string> split(const string& s) {
//    vector<string> res;
//    int numberStart = -1;
//    for (int i=0; i<s.size(); i++) {
//        switch (s[i]) {
//            case '+':
//            case '-':
//            case '*':
//            case '/':
//                res.emplace_back(s.begin()+numberStart, s.begin()+i);
//                res.emplace_back(string({s[i]}));
//                numberStart = -1;
//                break;
//            case '0' ... '9':
//            default:
//                if (numberStart < 0) {
//                    numberStart = i;
//                }
//                break;
//        }
//    }
//    res.emplace_back(s.begin()+numberStart, s.end());
//    return res;
//}
//
//vector<int> calcuate(const vector<int> lhs, const vector<int> rhs, char op) {
//    function<int(int, int)> f;
//    switch (op) {
//        case '+': f = [](int a, int b) { return a + b; }; break;
//        case '-': f = [](int a, int b) { return a - b; }; break;
//        case '*': f = [](int a, int b) { return a * b; }; break;
//        case '/': f = [](int a, int b) { return a / b; }; break;
//    }
//
//    vector<int> res;
//    for (const auto& m: lhs) {
//        for (const auto& n: rhs) {
//            res.emplace_back(f(m, n));
//        }
//    }
//    return res;
//}
//
//vector<int> computer(const vector<string> v, int from, int to, unordered_map<int, vector<int>>& memory) {
//    if (from > to) return {};
//    if (from == to) return { stoi(v[from]) };
//
//    int key = from*v.size() + to;
//    if (memory.count(key) > 0 ) {
//        return memory[key];
//    }
//
//    vector<int> res;
//    for (int i=from+1; i<=to; i=i+2) {
//        vector<int> lhs = computer(v, from, i-1, memory);
//        vector<int> rhs = computer(v, i+1, to, memory);
//        vector<int> val = calcuate(lhs, rhs, v[i][0]);
//        res.insert(res.end(), val.begin(), val.end());
//    }
//    memory[key] = res;
//    return res;
//}
//
//vector<int> diffWaysToCompute(string input) {
//    vector<string> s = split(input);
//    unordered_map<int, vector<int>> map;
//    return computer(s, 0, s.size()-1, map);
//}
