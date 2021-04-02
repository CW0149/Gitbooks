# [重复叠加字符串匹配](https://leetcode-cn.com/problems/repeated-string-match)

### 问题

给定两个字符串 A 和 B, 寻找重复叠加字符串A的最小次数，使得字符串B成为叠加后的字符串A的子串，如果不存在则返回 -1。

举个例子，A = "abcd"，B = "cdabcdab"。

答案为 3， 因为 A 重复叠加三遍后为 “abcdabcdabcd”，此时 B 是其子串；A 重复叠加两遍后为"abcdabcd"，B 并不是其子串。

注意:

 A 与 B 字符串的长度在1和10000区间范围内。

### 解答

```
/**
 * @param {string} A
 * @param {string} B
 * @return {number}
 */
// 想象无数A圈成环，B为在环上截取的字符串
// 转为判断B是否是A的重复叠加，如果是求B跨越的A的个数
// 若B是A的重复叠加，个数不超过Math.ceil(B.length / A.length) + 1
// 判断是否存在可通过判断B是否是A*最大个数的子串
// s匹配B后余下一个A的长度，次数减一
var repeatedStringMatch = function(A, B) {
    let times = Math.ceil(B.length / A.length) + 1

    const s = A.repeat(times), indexB = s.indexOf(B)
    return indexB === -1 ? -1 : (indexB + B.length + A.length <= s.length ? times - 1 : times)
};
```
