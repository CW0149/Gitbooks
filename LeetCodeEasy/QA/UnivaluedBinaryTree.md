# [单值二叉树](https://leetcode-cn.com/problems/univalued-binary-tree)

### 问题

如果二叉树每个节点都具有相同的值，那么该二叉树就是单值二叉树。

只有给定的树是单值二叉树时，才返回 true；否则返回 false。



示例 1：

<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/12/29/screen-shot-2018-12-25-at-50104-pm.png" width="300">

```
输入：[1,1,1,1,1,null,1]
输出：true
```
示例 2：


<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/12/29/screen-shot-2018-12-25-at-50050-pm.png" width="300">

```
输入：[2,2,2,5,2]
输出：false
 ```

提示：

* 给定树的节点数范围是 [1, 100]。
* 每个节点的值都是整数，范围为 [0, 99] 。

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
 * @return {boolean}
 */
var isUnivalTree = function(root) {
    const val = root.val
    function traverse(node, val) {
        if (!node) return true
        if (node.val === val) {
            return traverse(node.left, val) && traverse(node.right, val)
        }
        return false
    }
    return traverse(root.left, root.val) && traverse(root.right, root.val)
};
```
