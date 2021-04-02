# [字符串相加](https://leetcode-cn.com/problems/add-strings)

### 问题

给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。

注意：

* num1 和num2 的长度都小于 5100.
* num1 和num2 都只包含数字 0-9.
* num1 和num2 都不包含任何前导零。
* 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式。

### 解答

```
/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
var addStrings = function(num1, num2) {
    var c = 0, carry = 0, result = '', num, l1 = num1.length, l2 = num2.length;
    while (c < l1 || c < l2 || carry) {
        num = Number(num1[l1 - 1 - c] || '') + Number(num2[l2 - 1 - c] || '') + carry;
        carry = Math.floor(num / 10);
        result = num % 10 + result;
        c += 1;
    }
    return result;
};
```