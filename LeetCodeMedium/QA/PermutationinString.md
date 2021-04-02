# [字符串的排列](https://leetcode-cn.com/problems/permutation-in-string)

### 问题

给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

换句话说，第一个字符串的排列之一是第二个字符串的子串。

示例1:

```
输入: s1 = "ab" s2 = "eidbaooo"
输出: True
解释: s2 包含 s1 的排列之一 ("ba").
```

示例2:

```
输入: s1= "ab" s2 = "eidboaoo"
输出: False
```

注意：

1. 输入的字符串只包含小写字母
2. 两个字符串的长度都在 [1, 10,000] 之间

### 解答

```
/**
 * @param {string} s1
 * @param {string} s2
 * @return {boolean}
 */

function convert(str) {
    var result = {};
    for (let i = 0; i < str.length; i += 1) {
        var ch = str[i];
        result[ch] = result[ch] ? result[ch] + 1 : 1;
    }
    return result;
}

var checkInclusion = function(s1, s2) {
    if (s2.length < s1.length) return false;

    var convertedS1 = convert(s1);
    var store = JSON.stringify(convertedS1);
    let count = s1.length, start = 0;

    for (let i = 0; i < s2.length; i += 1) {
        var ch = s2[i];
        switch (convertedS1[ch]) {
            case undefined:
                convertedS1 = JSON.parse(store);
                count = s1.length;
                start = i + 1;
                break;
            case 0:
                convertedS1 = JSON.parse(store);
                count = s1.length;
                i = start + s2.slice(start, i).indexOf(ch);
                start = i + 1;
                break;
            default:
                convertedS1[ch] -= 1;
                if (--count === 0) return true;
        }
    }
    return false;
};
```