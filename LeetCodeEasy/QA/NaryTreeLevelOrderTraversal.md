# [N叉树的层序遍历](https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal)

### 问题

给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。

例如，给定一个 3叉树 :

<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/narytreeexample.png" width="300">


返回其层序遍历:

[
     [1],
     [3,2,4],
     [5,6]
]


说明:

树的深度不会超过 1000。
树的节点总数不会超过 5000。

### 解答

```
/**
 * // Definition for a Node.
 * function Node(val,children) {
 *    this.val = val;
 *    this.children = children;
 * };
 */
/**
 * @param {Node} root
 * @return {number[][]}
 */
解法一：
var levelOrder = function(root) {
    if (!root) return [];
    if (!root.children) return [[root.val]];
    return [[root.val]].concat(root.children.reduce(function(result, child) {
        var order = levelOrder(child);
        for (var i = 0; i < order.length; i += 1) {
            result[i] = (result[i] || []).concat(order[i]);
        }
        return result;
    }, []));
};

解法二：
var levelOrder = function(root) {
    var res = [];
    function dfs(root, level) {
        if (!root) return;
        res[level] = res[level] || [];
        res[level].push(root.val);
        root.children.forEach(function(child) {
           dfs(child, level + 1);
        });
    }
    dfs(root, 0);
    return res;
};
```