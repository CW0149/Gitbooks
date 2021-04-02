# [最长回文子串](https://leetcode-cn.com/problems/longest-palindromic-substring)

### 问题

给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

示例 1：

```
输入: "babad"
输出: "bab"
注意: "aba" 也是一个有效答案。
```
示例 2：

```
输入: "cbbd"
输出: "bb"
```

### 解答

```
/**
 * @param {string} s
 * @return {string}
 */

// 回文分奇偶，从回文中心向外扩散
var longestPalindrome = function(s) {
    let max = 1, res = ''
    function expand(s, m, n) {
        const i = m - 1, j = n + 1
        if (s[i] && s[j] && s[i] === s[j]) return expand(s, i, j)
        const str = s.slice(m, n + 1)
        if (res.length < str.length) res = str
        return str
    }
    for (let i = 0; i < s.length; i += 1) {
        expand(s, i, i)
        if (s[i] === s[i + 1]) expand(s, i, i + 1)
    }
    return res
};
```

