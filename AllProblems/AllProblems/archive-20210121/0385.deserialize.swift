//
//  0385.deserialize.swift
//  AllProblems
//
//  Created by liuning on 2021/1/18.
//

import Foundation

//#include <string>
//#include <vector>
//using namespace std;
//
//NestedInteger deserialize(string s) {
//    string ts = s + "#";
//    bool isMinus = false;
//    bool isPendingNumber = false;
//    int number = 0;
//    vector<NestedInteger> stack;
//    stack.emplace_back(NestedInteger());
//
//    for (int i=0; i<ts.size(); ++i) {
//        switch(ts[i]) {
//            case '0' ... '9':
//                number = number*10 + ts[i] - '0';
//                isPendingNumber = true;
//                break;
//            case '[':
//                stack.emplace_back(NestedInteger());
//                break;
//            case ']':
//            case ',':
//            case '#':
//                if (isPendingNumber) {
//                    int num = isMinus ? -number : number;
//                    stack.back().add(NestedInteger(num));
//                    isPendingNumber = false;
//                    number = 0;
//                    isMinus = false;
//                }
//
//                if (ts[i] == ']') {
//                    NestedInteger front = stack.back();
//                    stack.pop_back();
//                    stack.back().add(front);
//                }
//                break;
//            case '-':
//                isMinus = true;
//                break;
//        }
//    }
//
//    return stack.back().getList()[0];
//}
