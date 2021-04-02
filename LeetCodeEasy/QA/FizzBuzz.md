# [Fizz Buzz](https://leetcode-cn.com/problems/fizz-buzz)

### 问题

写一个程序，输出从 1 到 n 数字的字符串表示。

1. 如果 n 是3的倍数，输出“Fizz”；

2. 如果 n 是5的倍数，输出“Buzz”；

3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。

示例：

```
n = 15,

返回:
[
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
]
```

### 解答

```
/**
 * @param {number} n
 * @return {string[]}
 */
var fizzBuzz = function(n) {
    var result = [], num = 1;
    while (num <= n) {
        result.push((!(num % 3) ? 'Fizz' : '') + (!(num % 5) ? 'Buzz' : '') || String(num));
        num += 1;
    }
    return result;
};
```