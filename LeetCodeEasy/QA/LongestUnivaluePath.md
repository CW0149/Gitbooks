# [最长同值路径](https://leetcode-cn.com/problems/longest-univalue-path)

### 问题

给定一个二叉树，找到最长的路径，这个路径中的每个节点具有相同值。 这条路径可以经过也可以不经过根节点。

注意：两个节点之间的路径长度由它们之间的边数表示。

示例 1:

```
输入:

              5
             / \
            4   5
           / \   \
          1   1   5
输出:

2
```
示例 2:

```
输入:

              1
             / \
            4   5
           / \   \
          4   4   5
输出:

2
```
注意: 给定的二叉树不超过10000个结点。 树的高度不超过1000。

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
// 对于节点最长同值路径只有两种情况：
// 最长路径经过节点
// 最长路径在左右子树
function maxPath(node, val) {
    if (!node) return 0
    if (node.val !== val) return 0
    return 1 + Math.max(maxPath(node.left, val), maxPath(node.right, val))
}

var longestUnivaluePath = function(root) {
    if (!root) return 0
    return Math.max(
        maxPath(root.left, root.val) + maxPath(root.right, root.val),
        longestUnivaluePath(root.left),
        longestUnivaluePath(root.right)
    )
};
```
