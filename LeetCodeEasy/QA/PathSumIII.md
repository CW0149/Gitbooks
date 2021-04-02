# [路径总和 III](https://leetcode-cn.com/problems/path-sum-iii)

### 问题

给定一个二叉树，它的每个结点都存放着一个整数值。

找出路径和等于给定数值的路径总数。

路径不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

二叉树不超过1000个节点，且节点数值范围是 [-1000000,1000000] 的整数。

示例：

```
root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

      10
     /  \
    5   -3
   / \    \
  3   2   11
 / \   \
3  -2   1

返回 3。和等于 8 的路径有:

1.  5 -> 3
2.  5 -> 2 -> 1
3.  -3 -> 11
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
 * @param {number} sum
 * @return {number}
 */
解法一：
 function dfs1(node, sum) {
     if (!node) return 0;
     return dfs(node, sum) + dfs1(node.left, sum) + dfs1(node.right, sum);
 }
 function dfs(node, sum) {
     if (!node) return 0;
     return dfs(node.left, sum - node.val) + dfs(node.right, sum - node.val) + (node.val === sum ? 1 : 0);
 }
 var pathSum = function(root, sum) {
     return dfs1(root, sum);
 };

参考一：
function allSum(root, parent) {
    if (!root) return [];
    if (!root.left && !root.right)
        return [{ val: root.val, begin: root, end: root, parent: parent }];
    var subSum = allSum(root.left, root)
                .concat(allSum(root.right, root));
    return subSum
        .concat([{val: root.val, begin: root, end: root, parent: parent}])
        .concat(
            subSum
                .filter(function(node) {
                    return node.parent === root;
                })
                .map(function(node) {
                    return {
                        val: node.val + root.val,
                        begin: root,
                        parent: parent,
                        end: node.end
                    };
                })
        );
}
var pathSum = function(root, sum) {
    var sums = allSum(root, null);
    return sums.filter(function(node) {
       return node.val === sum;
    }).length;
};
```