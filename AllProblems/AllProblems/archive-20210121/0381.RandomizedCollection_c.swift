//
//  0381.RandomizedCollection.swift
//  AllProblems
//
//  Created by liuning on 2021/1/14.
//

import Foundation

// the key point is doing the "swap"

//#include <vector>
//#include <unordered_map>
//#include <unordered_set>
//using namespace std;
//
//class RandomizedCollection {
//    unordered_map<int, unordered_set<int>> indexMap;
//    vector<int> values;
//
//public:
//    RandomizedCollection() {}
//
//    bool insert(int val) {
//        values.push_back(val);
//        unordered_set<int>& indexes = indexMap[val];
//        indexes.insert(values.size()-1);
//        return indexes.size() == 1;
//    }
//
//    bool remove(int val) {
//        unordered_set<int>& indexes = indexMap[val];
//        if (indexes.empty()) return false;
//
//        const int N = values.size();
//
//        int idx = *(indexes.begin());
//        if (idx == N-1) {
//            values.pop_back();
//            indexes.erase(idx);
//        } else {
//            int tail = values[N-1];
//
//            swap(values[idx], values[N-1]);
//            values.pop_back();
//            indexes.erase(idx);
//
//            unordered_set<int>& tailIndexes = indexMap[tail];
//            tailIndexes.erase(N-1);
//            tailIndexes.insert(idx);
//        }
//
//        return true;
//    }
//
//    int getRandom() {
//        int randomIdx = rand()%(values.size());
//        return values[randomIdx];
//    }
//};
