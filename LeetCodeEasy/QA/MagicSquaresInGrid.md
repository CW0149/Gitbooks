# [矩阵中的幻方](https://leetcode-cn.com/problems/magic-squares-in-grid)

### 问题

3 x 3 的幻方是一个填充有从 1 到 9 的不同数字的 3 x 3 矩阵，其中每行，每列以及两条对角线上的各数之和都相等。

给定一个由整数组成的 N × N 矩阵，其中有多少个 3 × 3 的 “幻方” 子矩阵？（每个子矩阵都是连续的）。



示例 1:

```
输入: [[4,3,8,4],
      [9,5,1,9],
      [2,7,6,2]]
输出: 1
解释:
下面的子矩阵是一个 3 x 3 的幻方：
438
951
276

而这一个不是：
384
519
762

总的来说，在本示例所给定的矩阵中只有一个 3 x 3 的幻方子矩阵。
```
提示:

* 1 <= grid.length = grid[0].length <= 10
* 0 <= grid[i][j] <= 15

### 解答

```
/**
 * @param {number[][]} grid
 * @return {number}
 */
// 33幻方每行和为15
function checkMagicSquare(grid, s1, s2) {
    const set = new Set([1,2,3,4,5,6,7,8,9])
    let sum1 = sum2 = 0
    for (let i = 0; i < 3; i += 1) {
        sum1 = sum2 = 0
        for (let j = 0; j < 3; j += 1) {
            set.delete(grid[i + s1][j + s2])
            sum1 += grid[i + s1][j + s2]
            sum2 += grid[j + s1][i + s2]
        }
        if (sum1 !== 15) return false
        if (sum2 !== 15) return false
    }
    if (set.size) return false
    if ((grid[s1][s2] + grid[s1 + 1][s2 + 1] + grid[s1 + 2][s2 + 2] === 15) && (grid[s1][s2 + 2] + grid[s1 + 1][s2 + 1] + grid[s1 + 2][s2] === 15)) return true
    return false
}
var numMagicSquaresInside = function(grid) {
    let cnt = 0
    for (let i = 0; i <= grid.length - 3; i += 1) {
        for (let j = 0; j <= grid[0].length - 3; j += 1) {
            if (checkMagicSquare(grid, i, j)) cnt += 1
        }
    }
    return cnt
};
```
