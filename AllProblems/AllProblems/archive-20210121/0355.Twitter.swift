//
//  0355.Twitter.swift
//  AllProblems
//
//  Created by liuning on 2021/1/11.
//

import Foundation

//#include <vector>
//#include <unordered_map>
//#include <unordered_set>
//#include <deque>
//#include <queue>
//#include <algorithm>
//using namespace std;
//
//struct Msg {
//    int userId;
//    int tweetId;
//    int timestamp;
//};
//
//class Twitter {
//    unordered_map<int, unordered_set<int>> followerMap;
//    unordered_map<int, deque<Msg>> tweetsMap;
//    static const int MAX_TWEETS = 10;
//    int timestamp;
//public:
//    Twitter(): timestamp(0) {}
//
//    void postTweet(int userId, int tweetId) {
//        auto& q = tweetsMap[userId];
//        q.push_front({userId, tweetId, timestamp++});
//        if (q.size() > MAX_TWEETS) q.pop_back();
//    }
//
//    vector<int> getNewsFeed(int userId) {
//        unordered_set<int> temp = followerMap[userId];
//        temp.insert(userId);
//        vector<int> users(temp.begin(), temp.end());
//        vector<int> offset(users.size(), 0);
//        unordered_map<int, int> offsetMap;
//
//        auto compare = [](const Msg& lhs, const Msg& rhs) {
//            return lhs.timestamp < rhs.timestamp;
//        };
//        priority_queue<Msg, vector<Msg>, decltype(compare)> queue(compare);
//
//        for (int i=0; i<users.size(); ++i) {
//            int uid = users[i];
//            offsetMap[uid] = i;
//            if (offset[i] < tweetsMap[uid].size()) {
//                Msg& first = tweetsMap[uid][offset[i]];
//                queue.push({first.userId, first.tweetId, first.timestamp});
//                offset[i]++;
//            }
//        }
//
//        vector<int> res;
//        int count = 0;
//        while (count++ < MAX_TWEETS && !queue.empty()) {
//            auto& top = queue.top();
//            int uid = top.userId;
//            int tid = top.tweetId;
//            res.push_back(tid);
//
//            queue.pop();
//            int idx = offsetMap[uid];
//            if (offset[idx] < tweetsMap[uid].size()) {
//                Msg& first = tweetsMap[uid][offset[idx]];
//                queue.push({first.userId, first.tweetId, first.timestamp});
//                offset[idx]++;
//            }
//        }
//
//        return res;
//    }
//
//    void follow(int followerId, int followeeId) {
//        followerMap[followerId].insert(followeeId);
//    }
//
//    void unfollow(int followerId, int followeeId) {
//        followerMap[followerId].erase(followeeId);
//    }
//};
