# [3的幂](https://leetcode-cn.com/problems/power-of-three)

### 问题

给定一个整数，写一个函数来判断它是否是 3 的幂次方。

示例 1:

```
输入: 27
输出: true
```
示例 2:

```
输入: 0
输出: false
```
示例 3:

```
输入: 9
输出: true
```
示例 4:

```
输入: 45
输出: false
```
进阶：
你能不使用循环或者递归来完成本题吗？

### 解答

```
/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfThree = function(n) {
    while ((n % 3 === 0) && (n /= 3)) {}
    return n === 1;
};

// toString()
// '00' == false
var isPowerOfThree = function(n) {
    var ternary = n.toString(3);
    if (ternary[0] === '1' && ternary.slice(1) == false) return true;
    return false;
};
```

### Tips
* [2的幂](PowerofTwo)
* [4的幂](PowerofFour)