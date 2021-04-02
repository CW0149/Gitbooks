# [最长特殊序列 Ⅰ](https://leetcode-cn.com/problems/longest-uncommon-subsequence-i)

### 问题

给定两个字符串，你需要从这两个字符串中找出最长的特殊序列。最长特殊序列定义如下：该序列为某字符串独有的最长子序列（即不能是其他字符串的子序列）。

子序列可以通过删去字符串中的某些字符实现，但不能改变剩余字符的相对顺序。空序列为所有字符串的子序列，任何字符串为其自身的子序列。

输入为两个字符串，输出最长特殊序列的长度。如果不存在，则返回 -1。

示例 :

```
输入: "aba", "cdc"
输出: 3
解析: 最长特殊序列可为 "aba" (或 "cdc")
```
说明:

* 两个字符串长度均小于100。
* 字符串中的字符仅含有 'a'~'z'。


### 解答

```
/**
 * @param {string} a
 * @param {string} b
 * @return {number}
 */
var findLUSlength = function(a, b) {
    return a === b ? -1 : Math.max(a.length, b.length);
};

参考：
// 若更改题目：将子序列换成不计字符串相对顺序对异构子序列则是以下解法
// 判断是否异构
var findLUSlength = function(a, b) {
    if (a.length !== b.length) return Math.max(a.length, b.length);
    var len = a.length, chars = new Array(len).fill(0);
    for (var i = 0; i < len; i += 1) {
        chars[a.charCodeAt(i) - 97] += 1;
        chars[b.charCodeAt(i) - 97] -= 1;
    }
    for (i = 0; i < len; i += 1) {
        if (chars[i]) return a.length;
    }
    return -1;
};
```