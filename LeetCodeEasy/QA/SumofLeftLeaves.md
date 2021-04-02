# [左叶子之和](https://leetcode-cn.com/problems/sum-of-left-leaves)

### 问题

计算给定二叉树的所有左叶子之和。

示例：

```
    3
   / \
  9  20
    /  \
   15   7
   ```

在这个二叉树中，有两个左叶子，分别是 9 和 15，所以返回 24

### 解答

```
/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var sumOfLeftLeaves = function(root) {
    if (!root) return 0;
    if (root.left && !root.left.left && !root.left.right) return root.left.val + sumOfLeftLeaves(root.right);
    return sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right);
};
```