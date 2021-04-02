# [电话号码的字母组合](https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number)

### 问题

给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

<img src="http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png" width="200">

示例:

```
输入："23"
输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
```
说明:
尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

### 解答

```
/**
 * @param {string} digits
 * @return {string[]}
 */
 <!-- 使用一个数组暂存结果，不断更新数组 -->
var letterCombinations = function(digits) {
    if (!digits) return []

    const groups = new Map([['2', 'abc'], ['3', 'def'], ['4', 'ghi'], ['5', 'jkl'], ['6', 'mno'], ['7', 'pqrs'], ['8', 'tuv'], ['9', 'wxyz']])
    let res = ['']

    for (let digit of digits) {
        const group = groups.get(digit), temp = []
        for (let item of res) {
            for (let c of group) {
                temp.push(item + c)
            }
        }
        res = temp
    }
    return res
}
```

