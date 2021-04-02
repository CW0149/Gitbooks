# [Excel表列序号](https://leetcode-cn.com/problems/excel-sheet-column-number)

### 问题

给定一个Excel表格中的列名称，返回其相应的列序号。

例如，

```
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28
    ...
    ```
示例 1:

```
输入: "A"
输出: 1
```
示例 2:

```
输入: "AB"
输出: 28
```
示例 3:

```
输入: "ZY"
输出: 701
```

### 解答

```
/**
 * @param {string} s
 * @return {number}
 */
var titleToNumber = function(s) {
    if (!s) return 0;
    var result = 0, toMulti = 1;
    for (var i = s.length - 1; i >= 0; i -= 1) {
        result += (s[i].charCodeAt() - 64) * toMulti;
        toMulti *= 26;
    }
    return result;
};
```
