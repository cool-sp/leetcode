//
//  0386.lexicalOrder.swift
//  AllProblems
//
//  Created by liuning on 2021/1/18.
//

import Foundation


//#include <vector>
//using namespace std;
//
//void dfs(int base, int n, vector<int>& res) {
//    if (base > n) return;
//    res.push_back(base);
//
//    for (int i=0; i<=9; i++) {
//        dfs(base*10+i, n, res);
//    }
//}
//
//vector<int> lexicalOrder(int n) {
//    vector<int> res;
//    for (int i=1; i<=9; i++) {
//        dfs(i, n, res);
//    }
//    return res;
//}
