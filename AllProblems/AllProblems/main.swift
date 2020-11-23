//
//  main.swift
//  AllProblems
//
//  Created by liuning on 2020/11/18.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

wordBreak140("catsanddog",
          ["cat","cats","and","sand","dog"])

//canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])

//longestConsecutive([100,4,200,1,3,2])

//var m:[[Character]] = [["X","X","X","X"],
//                       ["X","O","O","X"],
//                       ["X","X","O","X"],
//                       ["X","O","X","X"]]
//solve(&m)


//let node5 = TreeNode(5)
//let node4a = TreeNode(4)
//let node8 = TreeNode(8)
//let node11 = TreeNode(11)
//let node13 = TreeNode(13)
//let node4b = TreeNode(4)
//let node7 = TreeNode(7)
//let node2 = TreeNode(2)
//let node1 = TreeNode(1)
//
//node5.left = node4a
//node5.right = node8
//node4a.left = node11
//node11.left = node7
//node11.right = node2
//node8.left = node13
//node8.right = node4b
//node4b.right = node1
//
//maxPathSum(node5)


//isPalindrome("A man, a plan, a canal: Panama")

//ladderLength("hit",
//             "cog",
//             ["hot","dot","dog","lot","log","cog"])

