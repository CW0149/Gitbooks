# [反转字符串 II](https://leetcode-cn.com/problems/reverse-string-ii)

### 问题

给定一个字符串和一个整数 k，你需要对从字符串开头算起的每2k个字符的前k个字符进行反转。如果剩余少于k个字符，则将剩余的所有全部反转。如果有小于2k但大于或等于 k 个字符，则反转前 k 个字符，并将剩余的字符保持原样。

示例:

```
输入: s = "abcdefg", k = 2
输出: "bacdfeg"
```
要求:

* 该字符串只包含小写的英文字母。
* 给定字符串的长度和 k 在[1, 10000]范围内。


### 解答

```
/**
 * @param {string} s
 * @param {number} k
 * @return {string}
 */
写法一：
var reverseStr = function(s, k) {
    var res = '', i = 0, x = 1;
    while (i < s.length) {
        var c = k, index1 = k * x * 2 -k - 1, index2 = index1 + 1;
        if (index1 >= s.length) index1 = s.length - 1;
        while (c-- && (i < s.length)) {
            res += s[index1];
            index1 -= 1;
            i += 1;
        }
        res += s.slice(index2, index2 + k);
        i += k;
        x += 1;
    }
    return res;
};

写法二：
var reverseStr = function(s, k) {
    var str = '';
    for (var i = 0; i < s.length; i += k) {
        if ((i / k) % 2 == 0) {
            var start = i + k;
            start = start > s.length ? s.length : start;
            for (var j = start - 1; j >= i; j--) {
                str += s[j];
            }
        } else {
            str += s.substr(i, k);
        }
    }
    return str;
};
```