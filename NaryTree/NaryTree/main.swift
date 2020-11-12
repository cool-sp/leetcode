//
//  main.swift
//  NaryTree
//
//  Created by liuning on 2020/11/11.
//

import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
