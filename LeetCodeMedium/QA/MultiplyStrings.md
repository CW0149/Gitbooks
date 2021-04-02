# [字符串相乘](https://leetcode-cn.com/problems/multiply-strings)

### 问题

给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。

示例 1:

```
输入: num1 = "2", num2 = "3"
输出: "6"
```
示例 2:

```
输入: num1 = "123", num2 = "456"
输出: "56088"
```
说明：

* num1 和 num2 的长度小于110。
* num1 和 num2 只包含数字 0-9。
* num1 和 num2 均不以零开头，除非是数字 0 本身。
* 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。

### 解答

```
/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
var multiply = function(num1, num2) {
    var chArr = []
    for (var i = 0; i < num1.length; i += 1) {
        for (var j = 0; j < num2.length; j += 1) {
            chArr[i + j] = (chArr[i + j] || 0) + num1[i] * num2[j]
        }
    }
    var index = chArr.length - 1, carry = 0, validIndex = 0;
    while(index >= 0) {
        chArr[index] += carry;
        carry = Math.floor(chArr[index] / 10);
        chArr[index] = chArr[index] % 10;
        index -= 1;
    }
    if (!carry) {
        while(!chArr[validIndex] && (validIndex < chArr.length)) {
            validIndex += 1;
        }
        return chArr.slice(validIndex).join('') || '0'
    } else {
        return carry + chArr.join('');
    }
};
```