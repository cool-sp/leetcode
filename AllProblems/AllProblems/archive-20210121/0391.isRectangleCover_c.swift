//
//  0391.isRectangleCover.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

// https://www.youtube.com/watch?v=8JM_dyOu_JY

//#include <vector>
//#include <utility>
//#include <set>
//using namespace std;
//
//bool isRectangleCover(vector<vector<int>>& rectangles) {
//    set<pair<int, int>> mySet;
//
//    int area = 0;
//    for (const auto& v: rectangles) {
//        // p3   p4
//        // p1   p2
//        auto p1 = make_pair(v[0], v[1]);
//        auto p2 = make_pair(v[2], v[1]);
//        auto p3 = make_pair(v[0], v[3]);
//        auto p4 = make_pair(v[2], v[3]);
//
//        for (const auto& p: {p1, p2, p3, p4}) {
//            auto r = mySet.insert(p);
//            if (!r.second) mySet.erase(r.first);
//        }
//        area += (p4.first-p1.first) * (p4.second-p1.second);
//    }
//
//    if (mySet.size() != 4) return false;
//    auto& p1 = *mySet.begin();
//    auto& p4 = *mySet.rbegin();
//    return area == (p4.first-p1.first) * (p4.second-p1.second);
//}
