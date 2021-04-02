# [最长公共前缀](https://leetcode-cn.com/problems/longest-common-prefix)

### 问题

编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1:

```
输入: ["flower","flow","flight"]
输出: "fl"
```
示例 2:

```
输入: ["dog","racecar","car"]
输出: ""
解释: 输入不存在公共前缀。
```
说明:

所有输入只包含小写字母 a-z 。

### 解答

```
/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
    if (!strs.length) return '';
    if (strs.length === 1) return strs[0];

    let end = false, index = 0;

    while (!end) {
        for (let i = 1; i < strs.length; i += 1) {
            if (!strs[i][index] || (strs[i][index] !== strs[i - 1][index])) {
                end = true;
                return strs[0].slice(0, index);
            }
        }
        index += 1;
    }
    return strs[0].slice(0, index);
};
```

