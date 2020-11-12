//
//  sortedArrayToBST.swift
//  BinarySearchTree
//
//  Created by liuning on 2020/11/11.
//

// https://leetcode.com/explore/learn/card/introduction-to-data-structure-binary-search-tree/143/appendix-height-balanced-bst/1015/

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return generateBST(nums, 0, nums.count)
}

private func generateBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    if left >= right { return nil }
    if left < 0 { return nil }
    if right > nums.count { return nil }

    if left + 1 == right {
        return TreeNode(nums[left])
    }

    let mid = left + (right-left)/2
    let node = TreeNode(nums[mid])
    node.left = generateBST(nums, left, mid)
    node.right = generateBST(nums, mid+1, right)
    return node
}
