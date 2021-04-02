# [Excel表列名称](https://leetcode-cn.com/problems/excel-sheet-column-title)

### 问题

给定一个正整数，返回它在 Excel 表中相对应的列名称。

例如，

    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB
    ...
示例 1:

```
输入: 1
输出: "A"
```
示例 2:

```
输入: 28
输出: "AB"
```
示例 3:

```
输入: 701
输出: "ZY"
```


### 解答

```
/**
 * @param {number} n
 * @return {string}
 */
// 26进制
var convertToTitle = function(n) {
    var result = '';
    while (n) {
        result = String.fromCharCode(65 + (n - 1) % 26) + result;
        n = Math.floor((n - 1) / 26);
    }
    return result;
};
```