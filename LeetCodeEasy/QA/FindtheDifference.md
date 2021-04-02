# [找不同](https://leetcode-cn.com/problems/find-the-difference)

### 问题

给定两个字符串 s 和 t，它们只包含小写字母。

字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。

请找出在 t 中被添加的字母。



示例:

```
输入：
s = "abcd"
t = "abcde"

输出：
e

解释：
'e' 是那个被添加的字母。
```

### 解答

```
/**
 * @param {string} s
 * @param {string} t
 * @return {character}
 */
// 被添加的一定是奇数个的那一个
写法一：
var findTheDifference = function(s, t) {
    var newStr = s + t, m = {};
    for (var i = 0; i < newStr.length; i += 1) {
        if (!m[newStr[i]]) {
            m[newStr[i]] = 1;
        } else {
            delete m[newStr[i]];
        }
    }
    return Object.keys(m)[0];
};

写法二：
var findTheDifference = function(s, t) {
    var code = 0, str = s + t;
    for (var i = 0; i < str.length; i += 1) {
        code ^= str[i].charCodeAt(0);
    }
    return String.fromCharCode(code);
};
```
