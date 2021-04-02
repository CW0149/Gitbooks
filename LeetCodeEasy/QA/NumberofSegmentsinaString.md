# [字符串中的单词数](https://leetcode-cn.com/problems/number-of-segments-in-a-string)

### 问题

统计字符串中的单词个数，这里的单词指的是连续的不是空格的字符。

请注意，你可以假定字符串里不包括任何不可打印的字符。

示例:

```
输入: "Hello, my name is John"
输出: 5
```

### 解答

```
/**
 * @param {string} s
 * @return {number}
 */
解法一：
var countSegments = function(s) {
    return (s.match(/\S+/g) || []).length;
};

解法二：
var countSegments = function(s) {
    var c = 0, space = true;
    for (var i = 0; i < s.length; i += 1) {
        if (s[i] === ' ') {
            space = true;
        } else if (space) {
            c += 1;
            space = false;
        }
    }
    return c;
};
```