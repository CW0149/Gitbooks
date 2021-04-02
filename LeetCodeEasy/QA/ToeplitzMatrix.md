# [托普利茨矩阵](https://leetcode-cn.com/problems/toeplitz-matrix)

### 问题

如果一个矩阵的每一方向由左上到右下的对角线上具有相同元素，那么这个矩阵是托普利茨矩阵。

给定一个 M x N 的矩阵，当且仅当它是托普利茨矩阵时返回 True。

示例 1:

```
输入:
matrix = [
  [1,2,3,4],
  [5,1,2,3],
  [9,5,1,2]
]
输出: True
解释:
在上述矩阵中, 其对角线为:
"[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]"。
各条对角线上的所有元素均相同, 因此答案是True。
```
示例 2:

```
输入:
matrix = [
  [1,2],
  [2,2]
]
输出: False
解释:
对角线"[1, 2]"上的元素不同。
说明:

 matrix 是一个包含整数的二维数组。
matrix 的行数和列数均在 [1, 20]范围内。
matrix[i][j] 包含的整数在 [0, 99]范围内。
```
进阶:

如果矩阵存储在磁盘上，并且磁盘内存是有限的，因此一次最多只能将一行矩阵加载到内存中，该怎么办？
如果矩阵太大以至于只能一次将部分行加载到内存中，该怎么办？

### 解答

```
/**
 * @param {number[][]} matrix
 * @return {boolean}
 */
// 从左上开始，对角元素在行+1列+1的位置
// 对于右上角，遍历第一行，只需结束位置为i,j有一个不存在都位置
// 对于左下角，遍历矩阵行
var isToeplitzMatrix = function(matrix) {
    const row = matrix[0]
    for (let index = 0; index < row.length; index += 1) {
        let i = 1, j = index + 1, num = row[index]
        while (matrix[i] && matrix[i][j] >= 0) {
            if (matrix[i][j] !== num) return false
            i += 1
            j += 1
        }
    }
    for (let index = 1; index < matrix.length; index += 1) {
        let i = index + 1, j = 1, num = matrix[index][0]
        while (matrix[i] && matrix[i][j] >= 0) {
            if (matrix[i][j] !== num) return false
            i += 1
            j += 1
        }
    }
    return true
};
```