# [反转字符串中的单词 III](https://leetcode-cn.com/problems/reverse-words-in-a-string-iii)

### 问题

给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

示例 1:

```
输入: "Let's take LeetCode contest"
输出: "s'teL ekat edoCteeL tsetnoc"
```
注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

### 解答

```
/**
 * @param {string} s
 * @return {string}
 */
// 每个单词由单个空格分隔, 字符串中不会有任何额外的空格
写法一：
var reverseWords = function(s) {
    var res = '';
    for (var i = s.length - 1; i >= 0; i -= 1) {
        var str = '';
        while ((s[i] !== ' ') && i >= 0) {
            str += s[i];
            i -= 1;
        }
        res = res ? str + ' ' + res : str;
    }
    return res;
};

写法二：
var reverseWords = function(s) {
    var res = '', str = '';
    for (var i = s.length - 1; i >= 0; i -= 1) {
        if (s[i] === ' ') {
            res = res ? str + ' ' + res : str;
            str = '';
        } else {
            str += s[i];
        }
    }
    return res ? str + ' ' + res : str;
};
```