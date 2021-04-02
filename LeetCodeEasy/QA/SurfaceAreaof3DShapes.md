# [三维形体的表面积](https://leetcode-cn.com/problems/surface-area-of-3d-shapes)

### 问题

在 N * N 的网格上，我们放置一些 1 * 1 * 1  的立方体。

每个值 v = grid[i][j] 表示 v 个正方体叠放在单元格 (i, j) 上。

返回结果形体的总表面积。



示例 1：

```
输入：[[2]]
输出：10
```
示例 2：

```
输入：[[1,2],[3,4]]
输出：34
```
示例 3：

```
输入：[[1,0],[0,2]]
输出：16
```
示例 4：

```
输入：[[1,1,1],[1,0,1],[1,1,1]]
输出：32
```
示例 5：

```
输入：[[2,2,2],[2,1,2],[2,2,2]]
输出：46
```


提示：

* 1 <= N <= 50
* 0 <= grid[i][j] <= 50

### 解答

```
/**
 * @param {number[][]} grid
 * @return {number}
 */
// 转为数重叠边的个数
// 结果为个数*6 - 重叠边
// 重叠边分为相邻重叠和堆叠重叠
var surfaceArea = function(grid) {
    let cnt = sum = 0
    const dirs = [[-1,0],[1,0],[0,-1],[0,1]]
    for (let i = 0; i < grid.length; i += 1) {
        for (let j = 0; j < grid[i].length; j += 1) {
            if (grid[i][j]) {
                for (let dir of dirs) {
                    const nx = i + dir[0], ny = j + dir[1]
                    if (grid[nx] && grid[nx][ny]) {
                    cnt += Math.min(grid[i][j], grid[nx][ny])
                    }
                }
                cnt += (grid[i][j] - 1) * 2
                sum += grid[i][j]
            }
        }
    }
    console.log(sum, cnt)
    return sum * 6 - cnt
};
```
