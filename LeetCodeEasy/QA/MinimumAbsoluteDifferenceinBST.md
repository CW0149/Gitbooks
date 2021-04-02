# [二叉搜索树的最小绝对差](https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst)

### 问题

给定一个所有节点为非负值的二叉搜索树，求树中任意两节点的差的绝对值的最小值。

示例 :

```
输入:

   1
    \
     3
    /
   2

输出:
1

解释:
最小绝对差为1，其中 2 和 1 的差的绝对值为 1（或者 2 和 3）。
```
注意: 树中至少有2个节点。

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
解法一：
function search(node, res) {
    if (!node) return;
    var lnode = search(node.left, res), rnode = search(node.right, res);
    res.min = Math.min(
        res.min,
        lnode ? node.val - lnode.e : Infinity,
        rnode ? rnode.s - node.val : Infinity
    );
    return  { s: (lnode && lnode.s) || node.val, e: (rnode && rnode.e) || node.val };
}
var getMinimumDifference = function(root) {
    var res = { min: Infinity };
    search(root, res);
    return res.min;
};

解法二：
var getMinimumDifference = function(root) {
    var min = Number.MAX_SAFE_INTEGER;
    var last;

    function preorderRecursion (root) {
        if (!root) return;
        preorderRecursion(root.left);

        if (last != null) {
            min = Math.min(min, root.val - last);
        }
        last = root.val;

        preorderRecursion(root.right);
    }

    preorderRecursion(root);

    return min;
};
```