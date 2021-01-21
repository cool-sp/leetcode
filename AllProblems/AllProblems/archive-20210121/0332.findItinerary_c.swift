//
//  0332.findItinerary.swift
//  AllProblems
//
//  Created by liuning on 2021/1/10.
//

import Foundation

// https://www.youtube.com/watch?v=4udFSOWQpdg

//#include <vector>
//#include <string>
//#include <unordered_map>
//#include <deque>
//#include <algorithm>
//using namespace std;
//
//void traversal(unordered_map<string, deque<string>>& allTickets, vector<string>& res, const string& from) {
//    auto& dests = allTickets[from];
//
//    while (!dests.empty()) {
//        const string dest = dests.front();
//        dests.pop_front();
//        traversal(allTickets, res, dest);
//    }
//
//    res.emplace_back(from);
//}
//
//vector<string> findItinerary(vector<vector<string>>& tickets) {
//    unordered_map<string, deque<string>> allTickets;
//    for (const auto& t: tickets) {
//        auto from = t[0];
//        auto dest = t[1];
//        allTickets[from].emplace_back(dest);
//    }
//
//    for (auto& [from, dests]: allTickets) {
//        sort(dests.begin(), dests.end());
//    }
//
//    vector<string> res;
//    traversal(allTickets, res, "JFK");
//    return vector<string>(res.crbegin(), res.crend());
//}
