# [平方数之和](https://leetcode-cn.com/problems/sum-of-square-numbers)

### 问题

给定一个非负整数 c ，你要判断是否存在两个整数 a 和 b，使得 a2 + b2 = c。

示例1:

```
输入: 5
输出: True
解释: 1 * 1 + 2 * 2 = 5
```


示例2:

```
输入: 3
输出: False
```

### 解答

```
/**
 * @param {number} c
 * @return {boolean}
 */
// a可能等于b, a、b、c可能为0

写法一：
var judgeSquareSum = function(c) {
    for (let i = 0; i * i <= c; i += 1) {
        let j = c - i * i, sqrtJ = Math.sqrt(j)
        if (~~sqrtJ === sqrtJ) return true
    }
    return false
};

写法二：
var judgeSquareSum = function(c) {
    let i = num = 0
    while (num <= c) {
        let j = c - num, sqrtJ = Math.sqrt(j)
        if (Number.isInteger(sqrtJ)) return true
        i += 1
        num = i * i
    }
    return false
};
```
