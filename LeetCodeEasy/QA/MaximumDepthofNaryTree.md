# [N叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree)

### 问题

给定一个 N 叉树，找到其最大深度。

最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。

例如，给定一个 3叉树 :

<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/narytreeexample.png" width="300" />

我们应返回其最大深度，3。

说明:

树的深度不会超过 1000。
树的节点总不会超过 5000。

### 解答

```
"""
<!-- Python -->
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """
        def countDepth(root):
            if root is None:
                return 0
            if root.children == []:
                return 1
            return max(map(countDepth, root.children)) + 1

        return countDepth(root)
```