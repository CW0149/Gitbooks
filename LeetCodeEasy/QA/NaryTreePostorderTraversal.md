# [N叉树的后序遍历](https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal)

### 问题

给定一个 N 叉树，返回其节点值的后序遍历。

例如，给定一个 3叉树 :



<img src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/narytreeexample.png" width="300">



返回其后序遍历: [5,6,3,2,4,1].



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
    def postorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        if root is None:
            return []
        list = []
        def traverse(node):
            for child in node.children:
                traverse(child)
            list.append(node.val)
        traverse(root)
        return list

// 迭代解法
class Solution(object):
    def postorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        if root is None:
            return []
        stack = [root]
        list = []
        while len(stack):
            while len(stack[-1].children) and not hasattr(stack[-1], 'flag'):
                node = stack[-1]
                for child in node.children[::-1]:
                    stack.append(child)
                node.flag = 1
            node1 = stack.pop()
            list.append(node1.val)
            if hasattr(node1, 'flag'):
                del node1.flag
        return list
```


### 相关

[二叉树后序遍历](https://leetcode-cn.com/problems/binary-tree-postorder-traversal/)