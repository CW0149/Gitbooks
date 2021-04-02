# [杨辉三角 II](https://leetcode-cn.com/problems/pascals-triangle-ii)

### 问题

给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。


![图片](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)<br>
在杨辉三角中，每个数是它左上方和右上方的数的和。

示例:

```
输入: 3
输出: [1,3,3,1]
```
进阶：

你可以优化你的算法到 O(k) 空间复杂度吗？


### 解答

```
/**
 * @param {number} rowIndex
 * @return {number[]}
 */
解法一：
var getRow = function(rowIndex) {
    if (rowIndex === 0) return [1];
    if (rowIndex === 1) return [1, 1];
    var last = getRow(rowIndex - 1);
    var result = [1];
    for (var i = 0; i < last.length - 1; i += 1) {
        result.push(last[i] + last[i + 1]);
    }
    result.push(1);
    return result;
};

解法二：
var getRow = function(rowIndex) {
    var rowCount = rowIndex + 1;
    var mid = Math.ceil(rowCount / 2), result = [1], m;
    for (var i = 1; i < mid; i += 1) {
        m = i; num = 1;
        while (m) {
            num *= (rowCount - m) / m;
            m -= 1;
        }
        result.push(num);
    }
    return result.concat(result.slice(0, rowCount % 2 ? -1 : undefined).reverse());
}
```