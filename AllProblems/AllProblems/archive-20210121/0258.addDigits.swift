//
//  0258.addDigits.swift
//  AllProblems
//
//  Created by liuning on 2020/12/30.
//

import Foundation

func addDigits(_ num: Int) -> Int {
    return (num-1)%9 + 1
}
