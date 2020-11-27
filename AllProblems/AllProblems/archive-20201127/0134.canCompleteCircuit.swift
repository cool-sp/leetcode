//
//  0134.canCompleteCircuit.swift
//  AllProblems
//
//  Created by liuning on 2020/11/23.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    // the gas-cost consumption model will not change whatever which point we start
    // let's say:
    // gas  = [1,2,3,4,5]
    // cost = [3,4,5,1,2]
    // then gas-cost will be: [-2, -2, -2, 3, 3]
    // if we start from index 0, we can draw a picture with value:
    // x: [0,  1,  2,  3,  4,  5(0) ]
    // y: [0, -2, -4, -6, -3,  0    ]
    // we will notice it's a pattern of start with gas=0, and end with gas=0
    // but during this period, the gas is a minus number
    // in the above example, we add 6 for each item:
    // x: [0,  1,  2,  3,  4,  5(0), 6(1), 7(2), 8(3), 9(4), 10(0) ...]
    // y: [6,  4,  2,  0,  3,  6,    4,    2,    0,    3     6     ...]
    // the value at index 3 becomes zero, and this pattern is repeatable
    // so index 3 is the answer.

    // on the other hand, if the gas-cost curve is not ending with value >= 0
    // the pattern is not repeatable.
    // for example:
    // gas  = [2,3,4]
    // cost = [3,4,3]
    // gas-cost will be: [-1, -1, 0]
    // then we have
    // x: [0,  1,  2,  3(0), ...]
    // y: [0, -1, -2,  -1,   ...]
    // it is not repeatable, because when we move on:
    // x: [0,  1,  2,  3(0), 4(1), 5(2), 6(0), ...]
    // y: [0, -1, -2,  -1,   -2,   -3,   -2,   ...]
    // the gas is less and less ..., cannot be a cycle

    if gas.count < 0 { return -1 }
    if cost.count < 0 { return -1 }
    if gas.count != cost.count { return -1 }

    var arr = Array(repeating: 0, count: gas.count)
    for idx in 0..<gas.count {
        arr[idx] = gas[idx] - cost[idx]
    }

    var sum = 0
    var minSum = Int.max
    var result = 0
    for idx in 0..<gas.count {
        sum += arr[idx]
        if sum < minSum {
            result = idx
            minSum = sum
        }
    }

    if sum >= 0 { return (result + 1) % gas.count }
    else { return -1 }
}
