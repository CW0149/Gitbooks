# [N叉树的前序遍历](https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal)

### 问题

给定一个 N 叉树，返回其节点值的前序遍历。

例如，给定一个 3叉树 :

<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/narytreeexample.png" width="300">

返回其前序遍历: [1,3,5,6,2,4]。

说明: 递归法很简单，你可以使用迭代法完成此题吗?

### 解答

```
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def preorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        list = []
        def traverse(node):
            if node is None:
                return
            list.append(node.val)
            for child in node.children:
                traverse(child)

        traverse(root)
        return list

使用迭代法：
class Solution(object):
    def preorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        if not root:
            return []
        stack = [root]
        list = []
        while len(stack):
            node = stack.pop()
            list.append(node.val)
            for child in node.children[::-1]:
                stack.append(child)
        return list
```

### 相关

[二叉树前序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/)
