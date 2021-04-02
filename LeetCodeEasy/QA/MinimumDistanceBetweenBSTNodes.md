# [二叉搜索树结点最小距离](https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes)

### 问题

给定一个二叉搜索树的根结点 root, 返回树中任意两节点的差的最小值。

示例：

```
输入: root = [4,2,6,1,3,null,null]
输出: 1
解释:
注意，root是树结点对象(TreeNode object)，而不是数组。

给定的树 [4,2,6,1,3,null,null] 可表示为下图:

          4
        /   \
      2      6
     / \
    1   3

最小的差值是 1, 它是节点1和节点2的差值, 也是节点3和节点2的差值。
```
注意：

* 二叉树的大小范围在 2 到 100。
* 二叉树总是有效的，每个节点的值都是整数，且不重复。

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
// 前序遍历，两变量记录
解法一：递归
var minDiffInBST = function(root) {
    let min = Infinity, prev
    function traverse(node) {
        if (!node) return
        traverse(node.left)
        if (prev !== undefined) {
            min = Math.min(min, node.val - prev)
        }
        prev = node.val
        traverse(node.right)
    }
    traverse(root)
    return min
};

解法二：迭代
var minDiffInBST = function(root) {
    const stack = []
    let prev, min = Infinity, node = root

    while(node || stack.length){
        while(node){
            stack.push(node)
            node = node.left
        }
        node = stack.pop()
        if (prev !== undefined) min = Math.min(min,node.val - prev)
        prev = node.val
        node = node.right
    }

    return min
};
```
