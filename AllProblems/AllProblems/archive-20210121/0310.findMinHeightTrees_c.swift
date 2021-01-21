//
//  0310.findMinHeightTrees.swift
//  AllProblems
//
//  Created by liuning on 2021/1/7.
//

import Foundation

//#include <vector>
//#include <deque>
//using namespace std;
//
//vector<int> findMinHeightTrees(int n, vector<vector<int>>& edges) {
//    if (n < 1) return {};
//    if (n == 1) return {0};
//
//    vector<int> degree(n, 0);
//    vector<vector<int>> graph(n, vector<int>());
//    for (const auto& v: edges) {
//        int node1 = v[0];
//        int node2 = v[1];
//        graph[node1].push_back(node2);
//        graph[node2].push_back(node1);
//        degree[node1]++;
//        degree[node2]++;
//    }
//
//    deque<int> queue;
//    for (int i=0; i<n; ++i) {
//        if (degree[i] == 1) {
//            queue.push_back(i);
//        }
//    }
//
//    int count = n;
//    while (count > 2) {
//        count -= queue.size();
//
//        int sz = queue.size();
//        for (int i=0; i<sz; ++i) {
//            int curr = queue.front();
//            queue.pop_front();
//
//            degree[curr] = 0;
//            for (int next: graph[curr]) {
//                if (degree[next] > 0) {
//                    degree[next]--;
//                }
//                if (degree[next] == 1) {
//                    queue.push_back(next);
//                }
//            }
//        }
//    }
//
//    return vector<int>(queue.begin(), queue.end());
//}
