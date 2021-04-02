# [二进制表示中质数个计算置位](https://leetcode-cn.com/problems/prime-number-of-set-bits-in-binary-representation)

### 问题

给定两个整数 L 和 R ，找到闭区间 [L, R] 范围内，计算置位位数为质数的整数个数。

（注意，计算置位代表二进制表示中1的个数。例如 21 的二进制表示 10101 有 3 个计算置位。还有，1 不是质数。）

示例 1:

```
输入: L = 6, R = 10
输出: 4
解释:
6 -> 110 (2 个计算置位，2 是质数)
7 -> 111 (3 个计算置位，3 是质数)
9 -> 1001 (2 个计算置位，2 是质数)
10-> 1010 (2 个计算置位，2 是质数)
```
示例 2:

```
输入: L = 10, R = 15
输出: 5
解释:
10 -> 1010 (2 个计算置位, 2 是质数)
11 -> 1011 (3 个计算置位, 3 是质数)
12 -> 1100 (2 个计算置位, 2 是质数)
13 -> 1101 (3 个计算置位, 3 是质数)
14 -> 1110 (3 个计算置位, 3 是质数)
15 -> 1111 (4 个计算置位, 4 不是质数)
```
注意:

* L, R 是 L <= R 且在 [1, 10^6] 中的整数。
* R - L 的最大值为 10000。

### 解答

```
/**
 * @param {number} L
 * @param {number} R
 * @return {number}
 */
// 0 1 [0,1]
// 1 2 [2,3]
// 1 2 2 3 [4,7]
// 1 2 2 3 2 3 3 4 [8, 15]
// .....
//   [2 ** 19, 2 ** 20 - 1 ]
// 10 ** 6最多20个2进制表示，其中质数为2, 3, 5, 7, 11, 13, 17, 19
// 某个数的位置为[x=num.toString(2).length - 1][num - 2 ** x]
var countPrimeSetBits = (function() {
    let arr = [[0, 1], [1, 2]]
    const primes = new Set([2, 3, 5, 7, 11, 13, 17, 19])
    for (let i = 2; i < 20; i += 1) {
        arr[i] = arr[i - 1].concat(arr[i - 1].map(n => n + 1))
    }
    return function(L, R) {
        let cnt = 0
        let i1 = L.toString(2).length - 1, i2 = R.toString(2).length - 1
        let j1 = L - 2 ** i1, j2 = R - 2 ** i2

        for (; i1 <= i2; i1 += 1) {
            for (; j1 < arr[i1].length; j1 += 1) {
                if (primes.has(arr[i1][j1])) cnt += 1
                if ((i1 === i2) && (j1 === j2)) return cnt
            }
            j1 = 0
        }
    }
})();
```
