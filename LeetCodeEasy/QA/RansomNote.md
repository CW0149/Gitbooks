# [赎金信](https://leetcode-cn.com/problems/ransom-note)

### 问题
给定一个赎金信 (ransom) 字符串和一个杂志(magazine)字符串，判断第一个字符串ransom能不能由第二个字符串magazines里面的字符构成。如果可以构成，返回 true ；否则返回 false。

(题目说明：杂志字符串中的每个字母只能使用一次。)

注意：

你可以假设两个字符串均只含有小写字母。

```
canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true
```

### 解答

```
/**
 * @param {string} ransomNote
 * @param {string} magazine
 * @return {boolean}
 */
var canConstruct = function(ransomNote, magazine) {
    var l1 = ransomNote.length, l2 = magazine.length;
    if (l1 > l2) return false;
    var map1 = {}, map2 = {};
    for (var i = 0; i < l2; i += 1) {
        map2[magazine[i]] = (map2[magazine[i]] || 0) + 1;
    }
    for (var i = 0; i < l1; i += 1) {
        var letter = ransomNote[i], times = map1[letter] || 0;
        if (!(map2[letter] > times)) return false;
        map1[letter] = times + 1;
    }
    return true;
};
```
