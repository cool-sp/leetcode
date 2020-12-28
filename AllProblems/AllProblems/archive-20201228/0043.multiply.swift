//
//  0043.multiply.swift
//  AllProblems
//
//  Created by liuning on 2020/12/9.
//

import Foundation

func multiply(_ num1: String, _ num2: String) -> String {
    guard num1.count > 0 else { return "" }
    guard num2.count > 0 else { return "" }

    if num1 == "0" || num2 == "0" { return "0" }
    if num1.count < num2.count { return multiply(num2, num1) }

    let num1 = num1.map { Int(String($0))! }
    let num2 = num2.map { Int(String($0))! }
    var res = Array(repeating: 0, count: num1.count + num2.count)

    for k in 0..<num2.count {
        let powOfTen = num2.count-1-k
        multiplyHelper(num1, num2[k], powOfTen, &res)
    }

    let resStr = res.map { Character(String($0)) }
    var idx = 0
    while resStr[idx] == "0" { idx += 1}
    return String(resStr[idx..<resStr.count])
}

private func multiplyHelper(_ nums: [Int], _ val: Int, _ powOfTen: Int, _ res: inout [Int]) {
    var arr = Array(repeating: 0, count: nums.count + 1)

    // do the multiply first
    var carryover = 0
    var i = nums.count - 1
    var j = arr.count - 1
    while i >= 0 {
        let num = nums[i]
        let mpVal = num * val + carryover

        let newCarryover = mpVal / 10
        let mod = mpVal % 10

        arr[j] = mod
        carryover = newCarryover

        i -= 1
        j -= 1
    }
    arr[j] = carryover

    var zeroCnt = powOfTen
    while zeroCnt > 0 {
        arr.append(0)
        zeroCnt -= 1
    }

    // then do the plus, adding to the result
    j = arr.count - 1
    var k = res.count - 1
    carryover = 0
    while k >= 0 {
        let arrVal = j < 0 ? 0 : arr[j]
        let plVal = arrVal + res[k] + carryover

        let newCarryover = plVal / 10
        let mod = plVal % 10

        res[k] = mod
        carryover = newCarryover

        j -= 1
        k -= 1
    }
}
