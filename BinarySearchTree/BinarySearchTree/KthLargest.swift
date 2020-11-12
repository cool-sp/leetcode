//
//  KthLargest.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/142/conclusion/1018/

import Foundation

public class TreeNodeEx {
    public var val: Int
    public var left: TreeNodeEx? = nil
    public var right: TreeNodeEx? = nil
    public var leftCnt: Int = 0
    public var rightCnt: Int = 0

    public init(_ val: Int) { self.val = val }
}

class KthLargest {
    var root: TreeNodeEx?
    var k: Int = 0

    init(_ k: Int, _ nums: [Int]) {
        self.k = k

        for num in nums {
            root = insert(root, num)
        }
    }

    func add(_ val: Int) -> Int {
        root = insert(root, val)

        if let node = findKth(root, k) {
            return node.val
        }
        return Int.min
    }

    private func findKth(_ root: TreeNodeEx?, _ k: Int) -> TreeNodeEx? {
        guard let root = root else { return nil }

        let leftCnt = root.leftCnt
        let rightCnt = root.rightCnt

        guard leftCnt + rightCnt + 1 >= k else { return nil }

        if rightCnt >= k {
            return findKth(root.right, k)
        } else if rightCnt == k-1 {
            return root
        } else {
            return findKth(root.left, k-1-rightCnt)
        }
    }

    private func insert(_ root: TreeNodeEx?, _ val: Int) -> TreeNodeEx {
        if root == nil {
            return TreeNodeEx(val)
        }

        var prev: TreeNodeEx? = nil
        var curr: TreeNodeEx? = root
        while(curr != nil) {
            prev = curr
            if val <= curr!.val {
                curr?.leftCnt += 1
                curr = curr?.left
            } else {
                curr?.rightCnt += 1
                curr = curr?.right
            }
        }

        if let prev = prev {
            if val <= prev.val {
                prev.left = TreeNodeEx(val)
            } else {
                prev.right = TreeNodeEx(val)
            }
        }

        return root!
    }
}
