# [二叉树的层平均值](https://leetcode-cn.com/problems/average-of-levels-in-binary-tree)

### 问题

给定一个非空二叉树, 返回一个由每层节点平均值组成的数组.

示例 1:

```
输入:
    3
   / \
  9  20
    /  \
   15   7
输出: [3, 14.5, 11]
解释:
第0层的平均值是 3,  第1层是 14.5, 第2层是 11. 因此返回 [3, 14.5, 11].
```
注意：

* 节点值的范围在32位有符号整数范围内。


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
 * @return {number[]}
 */

解法一：
var averageOfLevels = function(root) {
    const sum = [], average = []
    function traverse(node, level) {
        if (!node) return
        traverse(node.left, level + 1)
        traverse(node.right, level + 1)
        sum[level] = sum[level] || [0, 0]
        sum[level] = [sum[level][0] + node.val, sum[level][1] + 1]
        average[level] = sum[level][0] / sum[level][1]
    }
    traverse(root, 0)
    return average
};

解法二：
function sumOfLevels(node) {
    if (!node) return []
    if (!node.left && !node.right) {
        return [[node.val, 1]]
    }

    const aL = sumOfLevels(node.left)
    const aR = sumOfLevels(node.right)
    let i = 0
    while ((i < aL.length) || (i < aR.length)) {
        if (!aL[i]) {
            aL[i] = aR[i]
        } else if (aR[i]) {
            aL[i] = [aL[i][0] + aR[i][0], aL[i][1] + aR[i][1]]
        }
        i += 1
    }
    return [[node.val, 1], ...aL]
}
var averageOfLevels = function(root) {
    return sumOfLevels(root).map((item) => item[0] / item[1])
};

解法三：迭代法
var averageOfLevels = function(root) {
    if (!root) return []
    const average = []
    let list = [root], stack, sum
    while (list.length) {
        stack = []
        sum = 0
        for (let node of list) {
            if (node.left) stack.push(node.left)
            if (node.right) stack.push(node.right)
            sum += node.val
        }
        average.push(sum / list.length)
        list = stack
    }
    return average
};
```
