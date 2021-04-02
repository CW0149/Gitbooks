# [字符的最短距离](https://leetcode-cn.com/problems/shortest-distance-to-a-character)

### 问题

给定一个字符串 S 和一个字符 C。返回一个代表字符串 S 中每个字符到字符串 S 中的字符 C 的最短距离的数组。

示例 1:

```
输入: S = "loveleetcode", C = 'e'
输出: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
```
说明:

* 字符串 S 的长度范围为 [1, 10000]。
* C 是一个单字符，且保证是字符串 S 里的字符。
* S 和 C 中的所有字母均为小写字母。

### 解答

```
/**
 * @param {string} S
 * @param {character} C
 * @return {number[]}
 */
var shortestToChar = function(S, C) {
    let prev = next = -1, j, res = []
    while (next < S.length) {
        j = next + 1
        while (S[j] !== C && S[j]) {
            j += 1
        }
        prev = next
        next = j

        if (prev === -1) {
            for (let i = 0; i <= next; i += 1) {
                res[i] = next - i
            }
        } else if (next === S.length) {
            for (let i = prev; i < next; i += 1) {
                res[i] = i - prev
            }
        } else {
            for (let i = prev + 1; i <= next; i += 1) {
                res[i] = Math.min(next - i, i - prev)
            }
        }
    }
    return res
};
```
