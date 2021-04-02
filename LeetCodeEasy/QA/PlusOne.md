# [加一](https://leetcode-cn.com/problems/plus-one)

### 问题

给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。

你可以假设除了整数 0 之外，这个整数不会以零开头。

示例 1:

```
输入: [1,2,3]
输出: [1,2,4]
解释: 输入数组表示数字 123。
```
示例 2:

```
输入: [4,3,2,1]
输出: [4,3,2,2]
解释: 输入数组表示数字 4321。
```

### 解答

```
/**
 * @param {number[]} digits
 * @return {number[]}
 */
var plusOne = function(digits) {
    var carry = 1, index = digits.length - 1;
    while (index >= 0) {
        digits[index] += carry;
        carry = parseInt(digits[index] / 10);
        digits[index] %= 10;
        index -= 1;
    }
    return carry ? [carry].concat(digits) : digits;
};
```