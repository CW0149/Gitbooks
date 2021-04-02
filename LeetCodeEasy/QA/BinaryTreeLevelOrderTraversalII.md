# [二叉树的层次遍历 II](https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii)

### 问题

给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）

例如：
给定二叉树 [3,9,20,null,null,15,7],

```
    3
   / \
  9  20
    /  \
   15   7
```
返回其自底向上的层次遍历为：

```
[
  [15,7],
  [9,20],
  [3]
]
```


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
 * @return {number[][]}
 */
var levelOrderBottom = function(root) {
    if (!root) return [];
    var lArr = levelOrderBottom(root.left), rArr = levelOrderBottom(root.right), m = n = [], count = 1;
    if (lArr.length >= rArr.length) { m = lArr; n = rArr; } else { m = rArr; n = lArr; }
    while (count <= n.length) {
        m[m.length - count] = lArr[lArr.length - count].concat(rArr[rArr.length - count]);
        count += 1;
    }
    m.push([root.val]);
    return m;
};
```

