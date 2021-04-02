# [两整数之和](https://leetcode-cn.com/problems/sum-of-two-integers)

### 问题

不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。

示例 1:

```
输入: a = 1, b = 2
输出: 3
```
示例 2:

```
输入: a = -2, b = 3
输出: 1
```

### 解答

```
/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
var getSum = function(a, b) {
    if (!a || !b) return a || b;
    return getSum(a ^ b, (a & b) << 1);
};
```
资料：
* [JS运算符](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Expressions_and_Operators)