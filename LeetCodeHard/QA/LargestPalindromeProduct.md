# [最大回文数乘积](https://leetcode-cn.com/problems/largest-palindrome-product)

### 问题

你需要找到由两个 n 位数的乘积组成的最大回文数。

由于结果会很大，你只需返回最大回文数 mod 1337得到的结果。

示例:

```
输入: 2

输出: 987

解释: 99 x 91 = 9009, 9009 % 1337 = 987
```

说明:

n 的取值范围为 [1,8]。

### 解答

```
/**
 * @param {number} n
 * @return {number}
 */
解法一：
function limitLongResult(n) {
    var midLen = Math.ceil(n / 2), min = 10 ** (midLen - 1), max = 10 * min - 1;
    var j = n % 2 ? - 1 : undefined;
    for (var i = max; i >= min; i -= 1) {
        var s = i.toString();
        var num = BigInt(s + Array.from(s.slice(0, j)).reverse().join(''));
        for (var j = max; j * j >= num; j -= 1) {
            if (num % BigInt(j) == 0) { return num % 1337n;}
        }
    }
}
var largestPalindrome = function(n) {
    return limitLongResult(2 * n) || limitLongResult(2 * n - 1);
};

解法二：
const largestPalindrome = n => {
  const max = 10 ** n - 1;
  const min = 10 ** (n - 1);
  for (let i = max; i >= min; i -= 1) {
    const hi = i * 10 ** i.toString().length;
    const lo = +Array.from(i.toString()).reverse().join('');
    for (let j = max; j * j > hi + lo; j -= 1) {
      const mod = hi % j;
      if ((mod + lo) % j === 0) return ((hi % 1337) + lo) % 1337;
    }
  }
  return 9;
};
```