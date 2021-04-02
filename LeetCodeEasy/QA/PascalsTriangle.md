# [杨辉三角](https://leetcode-cn.com/problems/pascals-triangle)

### 问题

给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。


![图片](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)<br>
在杨辉三角中，每个数是它左上方和右上方的数的和。

示例:

```
输入: 5
输出:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
```

### 解答

```
/**
 * @param {number} numRows
 * @return {number[][]}
 */
var generate = function(numRows) {
    if (numRows === 0) return [];
    var result = [[1]], index = 1, last, add;
    while (index < numRows) {
        last = result[index - 1] || [], result[index] = [1];
        for (var i = 0; i < last.length - 1; i += 1) {
            add = last[i] + last[i + 1];
            if (!isNaN(add)) {
                result[index].push(add);
            }
        }
        result[index].push(1);
        index += 1;
    }
    return result;
};
```