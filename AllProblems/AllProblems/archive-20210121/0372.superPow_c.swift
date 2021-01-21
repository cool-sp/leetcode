//
//  0372.superPow.swift
//  AllProblems
//
//  Created by liuning on 2021/1/13.
//

import Foundation

//#include <vector>
//using namespace std;
//
//int myPowModK(int base, int exp, int k) {
////    int newBase = base % k;
////    int res = 1;
////    for (int i=0; i<exp; i++) {
////        res *= newBase;
////        res %= k;
////    }
////    return res;
//
//    if (exp == 0) return 1;
//    int newBase = base % k;
//    int sub = myPowModK(newBase, exp/2, k);
//
//    if (exp % 2 == 1) {
//        int temp = (sub * sub) % k;
//        return (newBase * temp) % k;
//    } else {
//        return (sub * sub) % k;
//    }
//}
//
//int superPow(int a, vector<int>& b) {
//    const int k = 1337;
//    if (b.size() == 1) {
//        return myPowModK(a, b[0], k);
//    }
//
//    int last = b.back();
//    b.pop_back();
//
//    int part1 = myPowModK(a, last, k);
//    int part2 = myPowModK(superPow(a, b), 10, k);
//    return part1 * part2 % k;
//}
