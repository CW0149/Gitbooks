# [键盘行](https://leetcode-cn.com/problems/keyboard-row)

### 问题

给定一个单词列表，只返回可以使用在键盘同一行的字母打印出来的单词。键盘如下图所示。

<img alt="American keyboard" src="https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/keyboard.png" width="500" />

示例：

```
输入: ["Hello", "Alaska", "Dad", "Peace"]
输出: ["Alaska", "Dad"]
```

注意：

* 你可以重复使用键盘上同一字符。
* 你可以假设输入的字符串将只包含字母。

### 解答

```
/**
 * @param {string[]} words
 * @return {string[]}
 */
写法一：
var findWords = function(words) {
    var arr = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'], mp = {};
    for (var i = 0; i < arr.length; i += 1) {
        for (var j = 0; j < arr[i].length; j += 1) {
            var str = arr[i];
            mp[str[j]] = mp[str[j].toLowerCase()] = i;
        }
    }
    var res = [];
    for (i = 0; i < words.length; i += 1) {
        var word = words[i];
        for (j = 1; j < word.length; j += 1) {
            if (mp[word[j]] !== mp[word[j - 1]]) break;
        }
        if (j === word.length) res.push(word);
    }
    return res;
};

写法二：
/**
 * @param {string[]} words
 * @return {string[]}
 */
var findWords = function(words) {
    var arr = [2, 3, 3, 2, 1, 2, 2, 2, 1, 2, 2, 2, 3, 3, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 1, 3];
    var res = [];
    for (var i = 0; i < words.length; i += 1) {
        var word = words[i];
        var ch = arr[word.toLowerCase().charCodeAt(0) - 97];
        for (var j = 1; j < word.length; j += 1) {
            var code = word.charCodeAt(j);
            if (arr[code - (code >= 97 ? 97 : 65)] !== ch) break;
        }
        if (j === word.length) res.push(word);
    }
    return res;
};
```