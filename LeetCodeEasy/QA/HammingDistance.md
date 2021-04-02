# [汉明距离](https://leetcode-cn.com/problems/hamming-distance)

### 问题

两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

给出两个整数 x 和 y，计算它们之间的汉明距离。

注意：
0 ≤ x, y < 231.

示例:

````
输入: x = 1, y = 4

输出: 2

解释:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

上面的箭头指出了对应二进制位不同的位置。
       ````

### 解答

```
/**
 * @param {number} x
 * @param {number} y
 * @return {number}
 */
写法一：
var hammingDistance = function(x, y) {
    var diff = x ^ y, c = 0;
    while (diff) {
        c += diff & 1;
        diff >>= 1;
    }
    return c;
};

写法二：
var hammingDistance = function(x, y) {
    return (x ^ y).toString(2).replace(/0/g, '').length;
};
```