# [给定数字能组成的最大时间](https://leetcode-cn.com/problems/largest-time-for-given-digits)

### 问题*

给定一个由 4 位数字组成的数组，返回可以设置的符合 24 小时制的最大时间。

最小的 24 小时制时间是 00:00，而最大的是 23:59。从 00:00 （午夜）开始算起，过得越久，时间越大。

以长度为 5 的字符串返回答案。如果不能确定有效时间，则返回空字符串。



示例 1：

```
输入：[1,2,3,4]
输出："23:41"
```
示例 2：

```
输入：[5,5,5,5]
输出：""
```


提示：

* A.length == 4
* 0 <= A[i] <= 9

### 解答

```
/**
 * @param {number[]} A
 * @return {string}
 */
// 所有排列组合，然后剔除
var largestTimeFromDigits = function(A) {
    function fn(i) {
        if (i === A.length - 1) return ['' + A[i]]
        const arr = fn(i + 1)
        const res = []
        for (let s of arr) {
            for (let j = 0; j <= s.length; j += 1)
            res.push(s.slice(0, j) + A[i] + s.slice(j))
        }
        return res
    }
    const arr = fn(0).sort((a, b) => b - a)

    for (let str of arr) {
        const f = str.slice(0, 2), a = str.slice(2)
        if (f < 24 && a < 60) return `${f}:${a}`
    }
    return ''
};
```
