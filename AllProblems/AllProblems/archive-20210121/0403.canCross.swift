//
//  0403.canCross.swift
//  AllProblems
//
//  Created by liuning on 2021/1/20.
//

import Foundation

//#include <vector>
//#include <unordered_map>
//#include <unordered_set>
//using namespace std;
//
//bool canCross(vector<int>& stones) {
//    unordered_map<int, unordered_set<int>> jumps;
//    for (int stone: stones) {
//        jumps[stone] = {};
//    }
//    jumps[stones[0]].insert(0);
//
//    for (int i=0; i<stones.size(); i++) {
//        int currStone = stones[i];
//        for (int jump: jumps[currStone]) {
//            for (int v: {jump-1, jump, jump+1}) {
//                int nextStone = currStone + v;
//                if (v>0 && jumps.count(nextStone)>0) jumps[nextStone].insert(v);
//            }
//        }
//    }
//
//    return !jumps[stones.back()].empty();
//}
