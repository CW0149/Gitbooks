# [Z 字形变换](https://leetcode-cn.com/problems/zigzag-conversion)

### 问题

将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

```
L   C   I   R
E T O E S I I G
E   D   H   N
```
之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

请你实现这个将字符串进行指定行数变换的函数：

string convert(string s, int numRows);
示例 1:

```
输入: s = "LEETCODEISHIRING", numRows = 3
输出: "LCIRETOESIIGEDHN"
```
示例 2:

```
输入: s = "LEETCODEISHIRING", numRows = 4
输出: "LDREOEIIECIHNTSG"
解释:

L     D     R
E   O E   I I
E C   I H   N
T     S     G
```


### 解答

```
/**
 * @param {string} s
 * @param {number} numRows
 * @return {string}
 */
// 每numRows * 2 - 2可看为一个循环
var convert = function(s, numRows) {
    if (numRows === 1) return s
    const arr = [...Array(numRows)].map(_ => []), round = numRows * 2 - 2
    let i = 0, c = 0, r = 0
    while (i < s.length) {
        if (i % round === 0) {
            while (r < numRows) {
                arr[r][c] = s[i], i += 1, r += 1
            }
            c += 1, r -= 2
        } else {
            arr[r][c] = s[i]
            i += 1, r -= 1, c += 1
        }
    }

    return arr.reduce((s, a) => s + a.filter(c => c).join(''), '')
};
```

