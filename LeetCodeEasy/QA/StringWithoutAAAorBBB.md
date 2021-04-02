# [不含 AAA 或 BBB 的字符串](https://leetcode-cn.com/problems/string-without-aaa-or-bbb)

### 问题

给定两个整数 A 和 B，返回任意字符串 S，要求满足：

S 的长度为 A + B，且正好包含 A 个 'a' 字母与 B 个 'b' 字母；
子串 'aaa' 没有出现在 S 中；
子串 'bbb' 没有出现在 S 中。


示例 1：

```
输入：A = 1, B = 2
输出："abb"
解释："abb", "bab" 和 "bba" 都是正确答案。
```
示例 2：

```
输入：A = 4, B = 1
输出："aabaa"
```


提示：

* 0 <= A <= 100
* 0 <= B <= 100
* 对于给定的 A 和 B，保证存在满足要求的 S。

### 解答

```
/**
 * @param {number} A
 * @param {number} B
 * @return {string}
 */
// 连续a/b的个数都不超过2
// 转为使用较小的数分割较长字符串
// 多出的数是2:1的关系，若A > B
// 2x + a = A; x + a = B
// => x = A - B; a = 2B - A
var strWithout3a3b = function(A, B) {
    let m = {v: 'a', c: A}, l = {v: 'b', c: B}
    if (B > A) { m = {v: 'b', c: B}, l = {v: 'a', c: A} }
    if (m.c > l.c * 2 + 2) return false // 不存在

    let n1 = m.c - l.c, n2 = 2 * l.c - m.c
    if (n2 < 0) return (m.v + m.v + l.v).repeat(n1).slice(0, A + B)
    return (m.v + m.v + l.v).repeat(n1) + (m.v + l.v).repeat(n2)
};
```

