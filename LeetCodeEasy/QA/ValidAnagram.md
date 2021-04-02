# [有效的字母异位词](https://leetcode-cn.com/problems/valid-anagram)

### 问题

给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。

示例 1:

```
输入: s = "anagram", t = "nagaram"
输出: true
```
示例 2:

```
输入: s = "rat", t = "car"
输出: false
```
说明:
你可以假设字符串只包含小写字母。

进阶:
如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

### 解答

```
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */

写法一：
var isAnagram = function(s, t) {
    if (s.length !== t.length) return false;
    var map = {};
    for (var i = 0; i < s.length; i += 1) {
        var a = s[i], b = t[i];
        map[a] = map[a] ? map[a] + 1 : 1;
        map[b] = map[b] ? map[b] - 1 : -1;
        if (map[a] === 0) delete map[a];
        if (map[b] === 0) delete map[b];
    }
    return Object.keys(map).length === 0;
};

写法二：
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isAnagram = function(s, t) {
    if (s.length !== t.length) return false;
    var map = {};
    for (var i = 0; i < s.length; i += 1) {
        var a = s[i], b = t[i];
        if (map[a] === -1 || ((map[a] = (map[a] || 0) + 1) && false)) delete map[a];
        if (map[b] === 1 || ((map[b] = (map[b] || 0) -1) && false)) delete map[b];
    }
    return Object.keys(map).length === 0;
};
```