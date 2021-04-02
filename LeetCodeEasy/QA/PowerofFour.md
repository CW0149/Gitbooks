# [4的幂](https://leetcode-cn.com/problems/power-of-four)

### 问题

给定一个整数 (32 位有符号整数)，请编写一个函数来判断它是否是 4 的幂次方。

示例 1:

```
输入: 16
输出: true
```
示例 2:

```
输入: 5
输出: false
```
进阶：
你能不使用循环或者递归来完成本题吗？

### 解答

```
/**
 * @param {number} num
 * @return {boolean}
 */
var isPowerOfFour = function(num) {
    if (num <= 0) return false;
    if ((num = Math.sqrt(num)) && (num !== Math.floor(num))) return false;
    return !(num & (num - 1));
};
```

### Tips
* [2的幂](PowerofTwo)
* [3的幂](PowerofThree)