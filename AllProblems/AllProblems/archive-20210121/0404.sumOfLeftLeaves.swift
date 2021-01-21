//
//  0404.sumOfLeftLeaves.swift
//  AllProblems
//
//  Created by liuning on 2021/1/20.
//

import Foundation

//struct TreeNode {
//    int val;
//    TreeNode *left;
//    TreeNode *right;
//    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
//};
//
//void helper(TreeNode* root, bool isLeft, int& res) {
//    if (root == nullptr) return;
//    if (!root->left && !root->right && isLeft) res += root->val;
//
//    if (root->left) helper(root->left, true, res);
//    if (root->right) helper(root->right, false, res);
//}
//
//int sumOfLeftLeaves(TreeNode* root) {
//    int res = 0;
//    helper(root, false, res);
//    return res;
//}
