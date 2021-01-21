//
//  0264.nthUglyNumber.swift
//  AllProblems
//
//  Created by liuning on 2020/12/30.
//

import Foundation

//#include<vector>
//using namespace std;
//
//int nthUglyNumber(int n) {
//    vector<int> array;
//    array.reserve(n);
//    array.push_back(1);
//
//    int p2 = 0;
//    int p3 = 0;
//    int p5 = 0;
//
//    while (array.size() < n) {
//        int next2 = array[p2]*2;
//        int next3 = array[p3]*3;
//        int next5 = array[p5]*5;
//        int minVal = min(min(next2, next3), next5);
//        array.push_back(minVal);
//
//        if (minVal == next2) p2++;
//        if (minVal == next3) p3++;
//        if (minVal == next5) p5++;
//    }
//
//    return array[array.size()-1];
//}
