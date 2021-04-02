# [建立四叉树](https://leetcode-cn.com/problems/construct-quad-tree)

### 问题

我们想要使用一棵四叉树来储存一个 N x N 的布尔值网络。网络中每一格的值只会是真或假。树的根结点代表整个网络。对于每个结点, 它将被分等成四个孩子结点直到这个区域内的值都是相同的.

每个结点还有另外两个布尔变量: isLeaf 和 val。isLeaf 当这个节点是一个叶子结点时为真。val 变量储存叶子结点所代表的区域的值。

你的任务是使用一个四叉树表示给定的网络。下面的例子将有助于你理解这个问题：

给定下面这个8 x 8 网络，我们将这样建立一个对应的四叉树：

<img src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/02/01/962_grid.png" width="200" />

由上文的定义，它能被这样分割：

<img src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/02/01/962_grid_divided.png" width="800" />



对应的四叉树应该像下面这样，每个结点由一对 (isLeaf, val) 所代表.

对于非叶子结点，val 可以是任意的，所以使用 * 代替。

<img src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/02/01/962_quad_tree.png" width="800" />

提示：

* N 将小于 1000 且确保是 2 的整次幂。
* 如果你想了解更多关于四叉树的知识，你可以参考这个 wiki 页面。

### 解答

```
/**
 * // Definition for a QuadTree node.
 * function Node(val,isLeaf,topLeft,topRight,bottomLeft,bottomRight) {
 *    this.val = val;
 *    this.isLeaf = isLeaf;
 *    this.topLeft = topLeft;
 *    this.topRight = topRight;
 *    this.bottomLeft = bottomLeft;
 *    this.bottomRight = bottomRight;
 * };
 */
/**
 * @param {number[][]} grid
 * @return {Node}
 */
function build(grid, x, y, len) {
    for (var i = x; i < x + len; i += 1) {
        for (var j = y; j < y + len; j += 1) {
            if (grid[i][j] !== grid[x][y]) {
                var halfLen = len / 2;
                return new Node('*', false,
                                build(grid, x, y, halfLen),
                                build(grid, x, y + halfLen, halfLen),
                                build(grid, x + halfLen, y, halfLen),
                                build(grid, x + halfLen, y + halfLen, halfLen)
                               );
            }
        }
    }
    return new Node(grid[x][y], true, null, null, null, null)
}
var construct = function(grid) {
    return build(grid, 0, 0, grid.length);
};
```