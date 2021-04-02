# [两数之和 IV - 输入 BST](https://leetcode-cn.com/problems/two-sum-iv-input-is-a-bst)

### 问题

给定一个二叉搜索树和一个目标结果，如果 BST 中存在两个元素且它们的和等于给定的目标结果，则返回 true。

案例 1:

```
输入:
    5
   / \
  3   6
 / \   \
2   4   7

Target = 9

输出: True
```


案例 2:

```
输入:
    5
   / \
  3   6
 / \   \
2   4   7

Target = 28

输出: False
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
 * @param {number} k
 * @return {boolean}
 */

解法一：
var findTarget = function(root, k) {
    const mp = {}
    function traverse(node) {
        if (!node) return false
        if (mp[k - node.val]) return true
        mp[node.val] = true
        return traverse(node.left) || traverse(node.right)
    }
    return traverse(root)
};

解法二：迭代法
var findTarget = function(root, k) {
    if (!root) return false
    const mp = {}, stack = [root]
    let i = 0
    while (i < stack.length) {
        if (mp[k - stack[i].val]) return true
        mp[stack[i].val] = true
        stack[i].left && stack.push(stack[i].left)
        stack[i].right && stack.push(stack[i].right)
        i += 1
    }
    return false
};
```
