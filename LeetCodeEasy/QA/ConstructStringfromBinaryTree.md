# [根据二叉树创建字符串](https://leetcode-cn.com/problems/construct-string-from-binary-tree)

### 问题

```
输入: 二叉树: [1,2,3,4]
       1
     /   \
    2     3
   /
  4

输出: "1(2(4))(3)"

解释: 原本将是“1(2(4)())(3())”，
在你省略所有不必要的空括号对之后，
它将是“1(2(4))(3)”。
```
示例 2:

```
输入: 二叉树: [1,2,3,null,4]
       1
     /   \
    2     3
     \
      4

输出: "1(2()(4))(3)"

解释: 和第一个示例相似，
除了我们不能省略第一个对括号来中断输入和输出之间的一对一映射关系。
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
 * @param {TreeNode} t
 * @return {string}
 */
var tree2str = function(t) {
    if (!t) return ''
    if (!t.left && !t.right) return `${t.val}`
    const left = tree2str(t.left), right = tree2str(t.right)
    return t.val + `(${left})` + (right ? `(${right})` : '')
};
```