# [验证回文字符串 Ⅱ](https://leetcode-cn.com/problems/valid-palindrome-ii)

### 问题

给定一个非空字符串 s，最多删除一个字符。判断是否能成为回文字符串。

示例 1:

```
输入: "aba"
输出: True
```
示例 2:

```
输入: "abca"
输出: True
解释: 你可以删除c字符。
```
注意:

字符串只包含从 a-z 的小写字母。字符串的最大长度是50000。

### 解答

```
/**
 * @param {string} s
 * @return {boolean}
 */
// 左右同时遍历，若不同skip掉，只有一次机会
function isPalindrome(s, i, j, chance) {
    while (i < j) {
        if (s[i] === s[j]) {
            i += 1
            j -= 1
        } else {
            if (!chance) return false
            return isPalindrome(s, i + 1, j, false) || isPalindrome(s, i, j - 1, false)
        }
    }
    return true
}
var validPalindrome = function(s) {
    return isPalindrome(s, 0, s.length - 1, true)
};
```