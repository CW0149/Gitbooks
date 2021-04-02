# [2的幂](https://leetcode-cn.com/problems/power-of-two)

### 问题

给定一个整数，编写一个函数来判断它是否是 2 的幂次方。

示例 1:

```
输入: 1
输出: true
解释: 20 = 1
```
示例 2:

```
输入: 16
输出: true
解释: 24 = 16
```
示例 3:

```
输入: 218
输出: false
```

### 解答

```
/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfTwo = function(n) {
    while ((n % 2 === 0) && (n /= 2)) {}
    return n === 1;
};

var isPowerOfTwo = function(n) {
    return n > 0 && !(n & (n - 1));
};
```
资料：
* [n & (n - 1)](https://stackoverflow.com/questions/4678333/n-n-1-what-does-this-expression-do)

### Tips
* [3的幂](PowerofThree)
* [4的幂](PowerofFour)