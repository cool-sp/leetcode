//
//  0331.isValidSerialization.swift
//  AllProblems
//
//  Created by liuning on 2021/1/9.
//

import Foundation

//#include <string>
//#include <deque>
//using namespace std;
//
//bool isValidSerialization(string preorder) {
//    if (preorder.empty()) return true;
//    deque<int> queue;
//
//    preorder += ",";
//    bool isDigit = false;
//    for (int i=0; i<preorder.size(); ++i) {
//        char c = preorder[i];
//        switch(c) {
//            case '0'...'9':
//                isDigit = true;
//                break;
//            case '#':
//                isDigit = false;
//                break;
//            case ',':
//                if (isDigit) {
//                    queue.push_back(0);
//                } else {
//                    if (!queue.empty()) {
//                        queue.back() += 1;
//                    }
//                    while (!queue.empty() && queue.back() == 2) {
//                        queue.pop_back();
//                        if (!queue.empty()) {
//                            queue.back() += 1;
//                        }
//                    }
//                    if (queue.empty() && i < preorder.size()-1) {
//                        return false;
//                    }
//                }
//                break;
//            default:
//                return false;
//        }
//    }
//
//    return queue.empty();
//}
