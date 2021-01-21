//
//  0290.wordPattern.swift
//  AllProblems
//
//  Created by liuning on 2021/1/3.
//

import Foundation

//#include <string>
//#include <vector>
//#include <unordered_map>
//using namespace std;
//
//void ltrim(string& str) {
//    str.erase(str.begin(), std::find_if(str.begin(), str.end(), [](unsigned char ch) { return !std::isspace(ch); }));
//}
//
//void rtrim(string& str) {
//    str.erase(std::find_if(str.rbegin(), str.rend(), [](unsigned char ch) { return !std::isspace(ch); }).base(), str.end());
//}
//
//vector<string> split(const string& str, const string& delimiter) {
//    string trimed = str;
//    ltrim(trimed);
//    rtrim(trimed);
//
//    vector<string> res;
//    string::size_type pos1 = 0;
//    string::size_type pos2 = trimed.find(delimiter, pos1);
//
//    while(pos2 != trimed.npos) {
//        res.emplace_back(trimed.substr(pos1, pos2-pos1));
//        pos1 = pos2 + delimiter.size();
//        pos2 = trimed.find(delimiter, pos1);
//    }
//
//    if (pos1 != trimed.npos) res.emplace_back(trimed.substr(pos1));
//
//    return res;
//}
//
//bool wordPattern(string pattern, string s) {
//    vector<string> splitted = split(s, " ");
//    if(pattern.size() != splitted.size()) return false;
//    unordered_map<unsigned char, string> mapOfChToStr;
//    unordered_map<string, unsigned char> mapOfStrToCh;
//
//    for (int i=0; i<pattern.size(); ++i) {
//        unsigned char ch = pattern[i];
//        string str = splitted[i];
//
//        if (mapOfChToStr.count(ch) > 0 && mapOfStrToCh.count(str) > 0) {
//            if (mapOfChToStr[ch] == str && mapOfStrToCh[str] == ch) {
//                continue;
//            } else {
//                return false;
//            }
//        } else if (mapOfChToStr.count(ch) == 0 && mapOfStrToCh.count(str) == 0) {
//            mapOfChToStr[ch] = str;
//            mapOfStrToCh[str] = ch;
//            continue;
//        } else {
//            return false;
//        }
//    }
//
//    return true;
//}
