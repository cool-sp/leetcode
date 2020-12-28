//
//  0132.minCut.swift
//  AllProblems
//
//  Created by liuning on 2020/12/24.
//

import Foundation

// dp[i][j] = true when:
// s[i] == s[j] && dp[i+1][j-1] = true
func minCut(_ s: String) -> Int {
    let s = Array(s)
    let N = s.count
    var dp = Array(repeating: Array(repeating: -1, count: N), count: N)

    for j in 0..<N {
        for i in 0...j {
            if i == j {
                dp[i][j] = Int.max
                continue
            } else if i == j - 1 {
                dp[i][j] = s[i] == s[j] ? Int.max : -1
            } else {
                dp[i][j] = (s[i] == s[j] && dp[i+1][j-1] == Int.max) ? Int.max : -1
            }
        }
    }

    if dp[0][N-1] >= 0 { return 0 }
    var res = 0

    // starting to do the BFS search
    // when doing the BFS, we need to "cut" the unncessary path
    // so we need to use something to flag our path
    // in order to do the flag, we leverage the dp array
    //   < 0, not a Palindrome
    //   = 0, Palindrome, and it's layer zero
    //   = 1, Palindrome, and it's layer one
    //   ...
    //   = Int.max, Palindrome, not visited yet
    var queue = [(Int, Int)]()
    for j in 0..<N {
        if dp[0][j] >= 0 {
            dp[0][j] = res
            queue.append((0, j))
        }
    }

    while !queue.isEmpty {
        res += 1

        let size = queue.count
        for k in 0..<size {
            let col = queue[k].1
            for j in col+1..<N {
                if dp[col+1][j] > 0 && res < dp[col+1][j] {
                    if j == N-1 { return res }
                    dp[col+1][j] = res
                    queue.append((col+1, j))
                }
            }
        }
        queue.removeFirst(size)
    }

    return res
}


//#include <string>
//#include <vector>
//#include <deque>
//using namespace std;
//
//int minCut(string s) {
//    int N = s.size();
//    vector<vector<int>> dp(N, vector<int>(N, -1));
//
//    for (int j=0; j<N; j++) {
//        for(int i=0; i<=j; i++) {
//            if (i == j) {
//                dp[i][j] = INT32_MAX;
//                continue;
//            } else if (i == j-1) {
//                dp[i][j] = s[i] == s[j] ? INT32_MAX : -1;
//            } else {
//                dp[i][j] = (s[i] == s[j] && dp[i+1][j-1] == INT32_MAX) ? INT32_MAX : -1;
//            }
//        }
//    }
//
//    if (dp[0][N-1] >= 0) return 0;
//    int res = 0;
//
//    deque<pair<int, int>> queue;
//    for(int j=0; j<N; j++) {
//        if (dp[0][j] >= 0) {
//            dp[0][j] = res;
//            queue.emplace_back(0, j);
//        }
//    }
//
//    while(!queue.empty()) {
//        res++;
//
//        int size = queue.size();
//        while(size>0) {
//            auto item = queue.front();
//            queue.pop_front();
//
//            int col = item.second;
//            for(int j=col+1; j<N; j++) {
//                if (dp[col+1][j] > 0 && res < dp[col+1][j]) {
//                    if (j==N-1) { return res; }
//                    dp[col+1][j] = res;
//                    queue.emplace_back(col+1, j);
//                }
//            }
//
//            size--;
//        }
//    }
//
//    return res;
//}
