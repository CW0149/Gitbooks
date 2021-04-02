# [字符串中的第一个唯一字符](https://leetcode-cn.com/problems/first-unique-character-in-a-string)

### 问题

给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

案例:

```
s = "leetcode"
返回 0.

s = "loveleetcode",
返回 2.
```


注意事项：您可以假定该字符串只包含小写字母。

### 解答

```
/**
 * @param {string} s
 * @return {number}
 */
解法一：
var firstUniqChar = function(s) {
    var m = {}, temp = {};
    for (var i = 0; i < s.length; i += 1) {
        var lt = s[i];
        if ((m[lt] = (m[lt] || 0) + 1) && (m[lt] === 1)) {
            temp[lt] = i;
        } else {
            devare temp[lt];
        }
    }
    var result = -1;
    Object.keys(temp).forEach(function(ele) {
        if ((temp[ele] < result) || (result === -1)) result = temp[ele];
    });
    return result;
};

解法二：
var firstUniqChar = function(s) {
   var ch = s.length;
    var alpha = "abcdefghijklmnopqrstuvwxyz";
    for (var i = 0; i < alpha.length; i++) {
        var index = s.indexOf(alpha[i]);
        if (index != -1 && index == s.lastIndexOf(alpha[i])) {
            if (index < ch) {
                ch = index;
            }
        }
    }
    return ch == s.length ? -1 : ch;
};
```