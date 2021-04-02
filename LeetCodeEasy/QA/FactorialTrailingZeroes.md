# [阶乘后的零](https://leetcode-cn.com/problems/factorial-trailing-zeroes)

### 问题

给定一个整数 n，返回 n! 结果尾数中零的数量。

示例 1:

```
输入: 3
输出: 0
解释: 3! = 6, 尾数中没有零。
```
示例 2:

```
输入: 5
输出: 1
解释: 5! = 120, 尾数中有 1 个零.
```
说明: 你算法的时间复杂度应为 O(log n) 。

### 解答

```
/**
 * @param {number} n
 * @return {number}
 */
// 5的数量为瓶颈, 因此可以不考虑2。问题转化为可以除多少次5。
// 5的倍数为n/5个，25的倍数n/25个....
var trailingZeroes = function(n) {
    var c5 = 0;
    while (n) {
        n = Math.floor(n / 5);
        c5 += n;
    }
    return c5;
};
```