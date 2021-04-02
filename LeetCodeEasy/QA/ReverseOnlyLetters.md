# [仅仅反转字母](https://leetcode-cn.com/problems/reverse-only-letters)

### 问题

给定一个字符串 S，返回 “反转后的” 字符串，其中不是字母的字符都保留在原地，而所有字母的位置发生反转。



示例 1：

```
输入："ab-cd"
输出："dc-ba"
```
示例 2：

```
输入："a-bC-dEf-ghIj"
输出："j-Ih-gfE-dCba"
```
示例 3：

```
输入："Test1ng-Leet=code-Q!"
输出："Qedo1ct-eeLg=ntse-T!"
```


提示：

* S.length <= 100
* 33 <= S[i].ASCIIcode <= 122
* S 中不包含 \ or "

### 解答

```
/**
 * @param {string} S
 * @return {string}
 */
var reverseOnlyLetters = function(S) {
    const arr = S.split('')
    let i = 0, j = S.length - 1, temp
    while (i < j) {
        const reg = /[a-z]/i, t1 = reg.test(arr[i]), t2 = reg.test(arr[j])
        if (t1 && t2) {
            temp = arr[j]
            arr[j] = arr[i]
            arr[i] = temp
            i += 1
            j -= 1
        } else {
            if (!t1) i += 1
            if (!t2) j -= 1
        }
    }
    return arr.join('')
};
```
