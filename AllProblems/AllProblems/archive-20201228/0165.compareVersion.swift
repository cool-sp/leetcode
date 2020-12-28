//
//  0165.compareVersion.swift
//  AllProblems
//
//  Created by liuning on 2020/12/25.
//

import Foundation

func compareVersion(_ version1: String, _ version2: String) -> Int {
    let arr1 = version1.split(separator: ".").map {Int($0)!}
    let arr2 = version2.split(separator: ".").map {Int($0)!}

    let count = min(arr1.count, arr2.count)
    for i in 0..<count {
        if arr1[i] < arr2[i] { return -1 }
        else if arr1[i] > arr2[i] { return 1 }
    }

    if arr1.count > count && isNonZero(arr1, count) { return 1 }
    else if arr2.count > count && isNonZero(arr2, count) { return -1 }
    else { return 0 }
}

private func isNonZero(_ arr: [Int], _ from: Int) -> Bool {
    for i in from..<arr.count {
        if arr[i] > 0 { return true }
    }
    return false
}



//#include <string>
//#include <vector>
//#include <deque>
//#include <unordered_map>
//using namespace std;
//
//void split(const string& str, vector<string>& res, const string& delimiter) {
//    string::size_type pos1 = 0;
//    string::size_type pos2 = str.find(delimiter, pos1);
//
//    while(pos2 != string::npos) {
//        res.emplace_back(str.substr(pos1, pos2-pos1));
//        pos1 = pos2 + delimiter.size();
//        pos2 = str.find(delimiter, pos1);
//    }
//
//    res.emplace_back(str.substr(pos1));
//}
//
//void transformToInt(const vector<string> arr,  vector<int>& res) {
//    for(const auto& str: arr) {
//        res.emplace_back(stoi(str));
//    }
//}
//
//bool isNonZero(const vector<int>& arr, int offset) {
//    for(int i=offset; i<arr.size(); i++) {
//        if(arr[i] > 0 ) return true;
//    }
//    return false;
//}
//
//int compareVersion(string version1, string version2) {
//    vector<string> strVec1;
//    vector<string> strVec2;
//    split(version1, strVec1, ".");
//    split(version2, strVec2, ".");
//
//    vector<int> intVect1;
//    vector<int> intVect2;
//    transformToInt(strVec1, intVect1);
//    transformToInt(strVec2, intVect2);
//
//    int count = min(intVect1.size(), intVect2.size());
//    for(int i=0; i<count; i++) {
//        if (intVect1[i] < intVect2[i]) return -1;
//        if (intVect1[i] > intVect2[i]) return 1;
//    }
//
//    if (intVect1.size() > count && isNonZero(intVect1, count)) return 1;
//    if (intVect2.size() > count && isNonZero(intVect2, count)) return -1;
//    return 0;
//}
