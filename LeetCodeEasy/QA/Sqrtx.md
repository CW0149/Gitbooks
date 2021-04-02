# [x 的平方根](https://leetcode-cn.com/problems/sqrtx)

### 问题

实现 int sqrt(int x) 函数。

计算并返回 x 的平方根，其中 x 是非负整数。

由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

示例 1:

```
输入: 4
输出: 2
```
示例 2:

```
输入: 8
输出: 2
```
说明: 8 的平方根是 2.82842...,
     由于返回类型是整数，小数部分将被舍去。

### 解答

```
/**
 * @param {number} x
 * @return {number}
 */

解法一：
var mySqrt = function(x) {
    var l = 0, r = x, mid;
    while (l <= r) {
        mid = Math.floor((l+ r) / 2);
        var powMid = mid ** 2;
        if (powMid === x) {
            return mid;
        } else if (powMid < x) {
            l = mid + 1;
        } else {
            r = mid - 1;
        }
    }
    return r;
};

解法二：
var cache = [];
var mySqrt = function(x) {
    var i = cache.length  - 1;
    if (x === cache[i]) {
        return i + 1;
    } else if (x < cache[i]) {
        var l = 0, r = i, mid;
        while (l <= r) {
            mid = Math.floor((l + r) / 2);
            if (cache[mid] === x) {
                return mid + 1;
            } else if (x < cache[mid]) {
                r = mid - 1;
            } else {
                l = mid + 1;
            }
        }
        return l;
    } else {
        i += 1;
        while ((cache[i] = (i + 1) ** 2) && (cache[i] <= x) ) {
            i += 1;
        }
        return i;
    }
};
```