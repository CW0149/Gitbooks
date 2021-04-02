# [计数质数](https://leetcode-cn.com/problems/count-primes)

### 问题

统计所有小于非负整数 n 的质数的数量。

示例:

```
输入: 10
输出: 4
解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
```


### 解答

```
/**
 * @param {number} n
 * @return {number}
 */
// 注意if中，boolean负数，undefined等特殊情况 比较。
var countPrimes = function(n) {
    var isPrime = new Array(n);
    isPrime[0] = isPrime[1] = false;
    for (var i = 2; i * i < n; i++) {
        if (isPrime[i] === false) continue;
        for (var j = i * i; j < n; j += i) {
            isPrime[j] = false;
        }
    }
   var notPrimeCount = 0;
   isPrime.forEach(item => notPrimeCount += 1)
   return n - notPrimeCount < 0 ? 0 : n - notPrimeCount;
};
```
资料：
* [new Array 与 [] 区别](https://stackoverflow.com/questions/931872/what-s-the-difference-between-array-and-while-declaring-a-javascript-ar/44471705#44471705)

