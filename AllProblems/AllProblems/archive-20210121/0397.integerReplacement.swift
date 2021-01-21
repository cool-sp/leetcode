//
//  0397.integerReplacement.swift
//  AllProblems
//
//  Created by liuning on 2021/1/19.
//

import Foundation

//func integerReplacement(_ n: Int) -> Int {
//    if n == 1 { return 0 }
//    else if n % 2 == 0 { return 1 + integerReplacement(n/2) }
//    else { return 1 + min(integerReplacement(n+1), integerReplacement(n-1)) }
//}

func integerReplacement(_ n: Int) -> Int {
    var n = n;
    var res = 0;

    while n > 1 {
        switch n & 3 {
        case 0: // ... 00
            res += 2
            n >>= 2
        case 1: // ... 01
            res += 1
            n -= 1
        case 2: // ... 10
            res += 1
            n >>= 1
        case 3: // ... 11
            if n == 3 {
                res += 2
                n = 1;
            } else {
                res += 1
                n += 1
            }
        default:
            break;
        }
    }

    return res;
}
