# [二叉树中第二小的节点](https://leetcode-cn.com/problems/second-minimum-node-in-a-binary-tree)

### 问题

给定一个非空特殊的二叉树，每个节点都是正数，并且每个节点的子节点数量只能为 2 或 0。如果一个节点有两个子节点的话，那么这个节点的值不大于它的子节点的值。

给出这样的一个二叉树，你需要输出所有节点中的第二小的值。如果第二小的值不存在的话，输出 -1 。

示例 1:

```
输入:
    2
   / \
  2   5
     / \
    5   7

输出: 5
说明: 最小的值是 2 ，第二小的值是 5 。
```
示例 2:

```
输入:
    2
   / \
  2   2

输出: -1
```
说明: 最小的值是 2, 但是不存在第二小的值。

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
// 最小的值从上往下排列，转为按层遍历寻找第二小的值
// 递归法：截至条件-大于根结点值
var findSecondMinimumValue = function(root) {
    const diff = new Set()
    function findDiff(node, val) {
        if (!node) return
        if (node.val !== val) {
            return diff.add(node.val)
        }
        findDiff(node.left, val)
        findDiff(node.right, val)
    }
    findDiff(root.left, root.val)
    findDiff(root.right, root.val)

    return diff.size ? Math.min.apply(null, [...diff]) :  -1
};

// 迭代法
var findSecondMinimumValue = function(root) {
    if (!root) return -1
    const stack = [root]
    let sec = Infinity, i = 0, min = root.val, val
    while (i < stack.length) {
        if (stack[i].left) {
            val = stack[i].left.val
            val === min ? stack.push(stack[i].left) : (sec = sec < val ? sec : val)
        }
        if (stack[i].right) {
            val = stack[i].right.val
            val === min ? stack.push(stack[i].right) :  (sec = sec < val ? sec : val)
        }
        i += 1
    }
    return isFinite(sec) ? sec : -1
}
```
