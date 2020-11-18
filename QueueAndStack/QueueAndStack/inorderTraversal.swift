//
//  inorderTraversal.swift
//  QueueAndStack
//
//  Created by liuning on 2020/11/17.
//

// https://leetcode.com/explore/learn/card/queue-stack/232/practical-application-stack/1383/

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var root = root
    var stack = [TreeNode?]()
    var result = [Int]()

    while(root != nil || !stack.isEmpty) {
        while(root != nil) {
            stack.append(root)
            root = root?.left
        }

        root = stack.last!
        stack.removeLast()
        result.append(root!.val)

        root = root?.right
    }

    return result
}
