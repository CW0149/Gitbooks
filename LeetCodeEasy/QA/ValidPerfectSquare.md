# [有效的完全平方数](https://leetcode-cn.com/problems/valid-perfect-square)

### 问题

给定一个正整数 num，编写一个函数，如果 num 是一个完全平方数，则返回 True，否则返回 False。

说明：不要使用任何内置的库函数，如  sqrt。

示例 1：

```
输入：16
输出：True
```
示例 2：

```
输入：14
输出：False
```


### 解答

```
/**
 * @param {number} num
 * @return {boolean}
 */

解法一：
var isPerfectSquare = function(num) {
    var i = 1;
    while (i * i < num) i += 1;
    return i * i === num;
};

解法二：
var isPerfectSquare = function(num) {
    return Number.isInteger(num ** 0.5);
};

解法三：
var isPerfectSquare = function(num) {
    var start = 1, end = num;
    while (start <= end) {
        var mid = Math.floor((start + end) / 2);
        var midSquare = mid ** 2;
        if (midSquare === num) {
            return true;
        } else if (midSquare < num) {
            start = mid + 1;
        } else {
            end = mid - 1;
        }
    }
    return false;
};
```