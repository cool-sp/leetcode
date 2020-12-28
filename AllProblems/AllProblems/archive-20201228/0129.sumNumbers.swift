//
//  0129.sumNumbers.swift
//  AllProblems
//
//  Created by liuning on 2020/12/24.
//

import Foundation

func sumNumbers(_ root: TreeNode?) -> Int {
    var res = 0
    sumHelper(root, 0, &res)
    return res
}

private func sumHelper(_ root: TreeNode?, _ carry: Int, _ res: inout Int) {
    guard let root = root else { return }

    if root.left == nil && root.right == nil  {
        res += carry*10 + root.val
        return
    }

    let nextCarry = carry*10 + root.val
    sumHelper(root.left, nextCarry, &res)
    sumHelper(root.right, nextCarry, &res)
}

//void sumHelper(TreeNode* root, int carry, int& res) {
//    if (root == nullptr) return;
//
//    int nextCarry = carry*10 + root->val;
//
//    if (!root->left && !root->right) {
//        res += nextCarry;
//    }
//    sumHelper(root->left, nextCarry, res);
//    sumHelper(root->right, nextCarry, res);
//}
//
//int sumNumbers(TreeNode* root) {
//    int res = 0;
//    sumHelper(root, 0, res);
//    return res;
//}
