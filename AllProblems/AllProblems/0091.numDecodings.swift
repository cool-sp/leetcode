//
//  0091.numDecodings.swift
//  AllProblems
//
//  Created by liuning on 2020/11/21.
//

import Foundation

func numDecodings(_ s: String) -> Int {
    // use DP to solve this problem
    // define f(i) is the answer of string with length i
    // then we will have:
    // - if s[i] == 0: f(i) = f(i-2)
    // - if s[i-1] == 1: f(i) = f(i-1) + f(i-2)
    // - if s[i-1] == 2:
    //      and if: 0 <= s[i] <= 6: f(i) = f(i-1) + f(i-2)
    //      and if: 6 <  s[i] <= 9: f(i) = f(i-2)
    //
    // let's make it a litte easy to understand:
    // say, f(i) is a number, it contains all the combination of [.., x] and [.., xx]
    // we mark count of [.., x] as single_part
    // and mark count of [.., xx] as double_part
    // then f(i) = single_part + double_part
    // and how single_part is coming from? it actually comes from all f(i-2)
    // think the concept of 'copy' and add one more sperated digit
    // so f(i) = single_part + double_part = f(i-2) + double_part
    // and image that we now go to f(i+1)
    // we copy all f(i) and add one more sperated digit
    // f(i+1) = f(i) + ...(?)
    // then the remaining part is basically the single_part in f(i)
    // so:
    // f(i+1) = f(i) + single_part_of_f(i) = f(i) + f(i-1)

    // f(-1) == 0
    // f(0)  == 1
    // f(1)  == 1
    // ...

    let s = Array(s)
    if s.count <= 0 { return 0 }
    if s[0] == "0" { return 0 }

    var pos = 1
    var f_i = 1
    var f_i_minus_1 = 1
    var f_i_minus_2 = 1

    while(pos < s.count) {
        if s[pos] == "0" {
            if s[pos-1] == "1" || s[pos-1] == "2" {
                f_i = f_i_minus_2
            } else {
                f_i = 0 // invalid
                break
            }

        } else if s[pos-1] == "1" {
            f_i = f_i_minus_1 + f_i_minus_2

        } else if s[pos-1] == "2" {
            let val = Int(String(s[pos]))!
            if val >= 0 && val <= 6 {
                f_i = f_i_minus_1 + f_i_minus_2
            } else {
                f_i = f_i_minus_1
            }

        }

        f_i_minus_2 = f_i_minus_1
        f_i_minus_1 = f_i
        pos += 1
    }

    return f_i
}

//func numDecodings(_ s: String) -> Int {
//    if s.count <= 0 { return 0 }
//    let s = Array(s)
//
//    if s[0] == "0" { return 0 }
//
//    // tailing means (key, value)
//    // key: the last decoded string
//    // value: for all the possible combinations, count of that key
//    var tailing = [String: Int]()
//
//    // append char and generate all possible combinations,
//    // keep the tail part
//    for ch in s {
//        if !append(&tailing, ch) {
//            break
//        }
//    }
//
//    return countOfTails(tailing)
//}
//
//
//private func append(_ tailing: inout [String: Int], _ ch: Character) -> Bool {
//    let count = tailing.count > 0 ? countOfTails(tailing) : 1
//
//    // remove all items with length == 2
//    // it's an invalid combination
//    for pair in tailing {
//        if pair.key.count >= 2 {
//            tailing[pair.key] = nil
//        }
//    }
//
//    // modify existing item
//    for pair in tailing {
//        if pair.key.count <= 1 {
//            let val = tailing[pair.key]
//            tailing[pair.key] = nil
//
//            if pair.key == "1"
//                || pair.key == "2" && Int(String(ch))! >= 0 && Int(String(ch))! <= 6 {
//
//                tailing[pair.key + String(ch)] = val
//            }
//        }
//    }
//
//    // copy the original tail, so for each item, we need to count it
//    if ch != "0" {
//        tailing[String(ch)] = count
//    }
//
//    return tailing.count > 0
//}
//
//private func countOfTails(_ tailing: [String: Int]) -> Int {
//    var result = 0
//    for pair in tailing {
//        result += pair.value
//    }
//    return result
//}
