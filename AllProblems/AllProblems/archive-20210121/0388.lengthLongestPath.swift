//
//  0388.lengthLongestPath.swift
//  AllProblems
//
//  Created by liuning on 2021/1/18.
//

import Foundation

//#include <string>
//#include <vector>
//using namespace std;
//
//int lengthLongestPath(string input) {
//    vector<pair<int, string>> stack;
//    stack.emplace_back(make_pair(2, "./"));
//
//    int res = 2;
//
//    string component;
//    bool isFile = false;
//    int slashCnt = 0;
//
//    string newInput = input + "#";
//    for (int i=0; i<newInput.size(); ++i) {
//        switch(newInput[i]) {
//            case '.':
//                isFile = true;
//            case ' ':
//            case 'a' ... 'z':
//            case 'A' ... 'Z':
//            case '0' ... '9':
//                component += newInput[i];
//                break;
//            case '\n':
//            case '#':
//                if (slashCnt+1 < stack.size()) {
//                    stack.erase(stack.begin() + slashCnt + 1, stack.end());
//                }
//                if (isFile) {
//                    int sz = stack.back().first + slashCnt + component.size();
//                    res = max(res, sz);
//                    isFile = false;
//                } else {
//                    int sz = stack.back().first + component.size();
//                    stack.emplace_back(make_pair(sz, component));
//                }
//                component = "";
//                slashCnt = 0;
//                break;
//            case '\t':
//                slashCnt += 1;
//                break;
//            default:
//                break;
//        }
//    }
//
//    return res-2;
//}
