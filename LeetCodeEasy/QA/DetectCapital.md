# [检测大写字母](https://leetcode-cn.com/problems/detect-capital)

### 问题

给定一个单词，你需要判断单词的大写使用是否正确。

我们定义，在以下情况时，单词的大写用法是正确的：

全部字母都是大写，比如"USA"。
单词中所有字母都不是大写，比如"leetcode"。
如果单词不只含有一个字母，只有首字母大写， 比如 "Google"。
否则，我们定义这个单词没有正确使用大写字母。

示例 1:

```
输入: "USA"
输出: True
```
示例 2:

```
输入: "FlaG"
输出: False
```
注意: 输入是由大写和小写拉丁字母组成的非空单词。

### 解答

```
/**
 * @param {string} word
 * @return {boolean}
 */
解法一：
var detectCapitalUse = function(word) {
    if (word.length < 2) return true;
    var firstUpper = word.charCodeAt(0) < 97;
    var secUpper = word.charCodeAt(1) < 97;
    if (!firstUpper && secUpper) return false;
    var testUpper = (firstUpper && secUpper) ? true : false;
    for (var i = 2; i < word.length; i += 1) {
        var isUpper = word.charCodeAt(i) < 97;
        if (isUpper !== testUpper) return false;
    }
    return true;
};

解法二：
var detectCapitalUse = function(word) {
    return /^([A-Z]+|[A-Z][a-z]*|[a-z]+)$/.test(word);
};
```