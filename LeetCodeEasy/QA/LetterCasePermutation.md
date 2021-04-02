# [字母大小写全排列](https://leetcode-cn.com/problems/letter-case-permutation)

### 问题

给定一个字符串S，通过将字符串S中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。

示例:
```
输入: S = "a1b2"
输出: ["a1b2", "a1B2", "A1b2", "A1B2"]

输入: S = "3z4"
输出: ["3z4", "3Z4"]

输入: S = "12345"
输出: ["12345"]
```
注意：

* S 的长度不超过12。
* S 仅由数字和字母组成。


### 解答

```
/**
 * @param {string} S
 * @return {string[]}
 */
// 递归法
var letterCasePermutation = function(S) {
    if (!S.length) return [S]
    function fn(str) {
        if (str.length === 1) {
            const code = str.charCodeAt()
            if (code >= 97 && code <= 122)
                return [String.fromCharCode(code - 32), str]
            if (code >= 65 && code <= 90)
                return [String.fromCharCode(code + 32), str]
            return [str]
        }
        const a1 = fn(str[0]), a2 = fn(str.slice(1)), res = []
        a1.forEach(s1 => {
            a2.forEach(s2 => {
                res.push(s1 + s2)
            })
        })
        return res
    }
    return fn(S)
};
```
