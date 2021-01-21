//
//  0407.trapRainWater.swift
//  AllProblems
//
//  Created by liuning on 2021/1/20.
//

import Foundation

//#include <vector>
//#include <queue>
//using namespace std;
//
//struct Pixl {
//    int x;
//    int y;
//    int v;
//    Pixl(int x, int y, int v): x(x), y(y), v(v) {}
//};
//
//int trapRainWater(vector<vector<int>>& heightMap) {
//    int rowCnt = heightMap.size();
//    int colCnt = heightMap[0].size();
//    vector<vector<bool>> memory(rowCnt, vector<bool>(colCnt, false));
//
//    auto compare = [](const Pixl& lhs, const Pixl& rhs){ return lhs.v > rhs.v; };
//    priority_queue<Pixl, vector<Pixl>, decltype(compare)> pq(compare);
//
//    for (int c=0; c<colCnt; ++c) {
//        memory[0][c] = true;
//        memory[rowCnt-1][c] = true;
//        pq.push({0, c, heightMap[0][c]});
//        pq.push({rowCnt-1, c, heightMap[rowCnt-1][c]});
//    }
//
//    for (int r=1; r<rowCnt-1; ++r) {
//        memory[r][0] = true;
//        memory[r][colCnt-1] = true;
//        pq.push({r, 0, heightMap[r][0]});
//        pq.push({r, colCnt-1, heightMap[r][colCnt-1]});
//    }
//
//    int res = 0;
//    while (!pq.empty()) {
//        auto top = pq.top();
//        pq.pop();
//
//        vector<int> dir = {-1, 0, 1, 0, -1};
//        for (int k=0; k<4; k++) {
//            int nx = top.x + dir[k];
//            int ny = top.y + dir[k+1];
//            if (nx>=0 && nx<rowCnt && ny>=0 && ny<colCnt && !memory[nx][ny]) {
//                if (top.v > heightMap[nx][ny]) {
//                    res += top.v - heightMap[nx][ny];
//                }
//                int bar = max(top.v, heightMap[nx][ny]);
//                memory[nx][ny] = true;
//                pq.push({nx, ny, bar});
//            }
//        }
//    }
//
//    return res;
//}
