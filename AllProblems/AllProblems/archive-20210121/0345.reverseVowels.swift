//
//  0345.reverseVowels.swift
//  AllProblems
//
//  Created by liuning on 2021/1/10.
//

import Foundation

//#include <string>
//using namespace std;
//
//bool isVowel(char c) {
//    char upperC = (char)toupper(c);
//    switch (upperC) {
//        case 'A':
//        case 'E':
//        case 'I':
//        case 'O':
//        case 'U': return true;
//        default: return false;
//    }
//}
//
//string reverseVowels(string s) {
//    if (s.empty()) return "";
//    int p = 0;
//    int q = s.size()-1;
//
//    while (true) {
//        while (p<s.size() && !isVowel(s[p])) p++;
//        while (q>=0 && !isVowel(s[q])) q--;
//
//        if (p < q) swap(s[p++], s[q--]);
//        else break;
//    }
//
//    return s;
//}
