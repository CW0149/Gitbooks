# [最后一个单词的长度](https://leetcode-cn.com/problems/length-of-last-word)

### 问题

给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。

如果不存在最后一个单词，请返回 0 。

说明：一个单词是指由字母组成，但不包含任何空格的字符串。

示例:

```
输入: "Hello World"
输出: 5
```

### 解答

```
/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLastWord = function(s) {
    var index = s.length -1;
    while (s[index] === ' ') index -= 1;
    s = s.slice(0, index + 1);
    while (s[index] && s[index] !== ' ') index -= 1;
    return s.length - 1 - index;
};
```